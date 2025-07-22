import 'package:drippydrop_app/feature/signup/data/models/singnup_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupRepository {
  final supabase = Supabase.instance.client;

  Future<dynamic> signup(SignupRequestModel model) async {
    try {
      final response = await supabase.auth.signUp(
        email: model.email,
        password: model.password,
      );

      final user = response.user;
      final session = response.session;

      if (user != null) {
        try {
          final profile = InsertUserProfileModel(
            id: user.id,
            firstName: model.firstName,
            lastName: model.lastName,
            phone: model.phone,
          );

          await supabase.from('user_profiles').insert(profile.toJson());
        } catch (e) {
          return SignupErrorModel(
            message: 'Signup succeeded, but saving profile failed.',
            requiresEmailConfirmation: false,
          );
        }

        return SignupSuccessModel(
          accessToken: session?.accessToken ?? '',
          refreshToken: session?.refreshToken ?? '',
          expiresIn: session?.expiresIn ?? 0,
          expiresAt: session?.expiresAt ?? 0,
          user: UserInfo(id: user.id, email: user.email ?? model.email),
        );
      } else {
        return SignupErrorModel(
          message:
              'Signup failed: Unexpected server response. Please try again.',
          requiresEmailConfirmation: false,
        );
      }
    } on AuthException catch (e) {
      return SignupErrorModel(message: e.message);
    } catch (e) {
      return SignupErrorModel(
        message: 'Unexpected error during signup: ${e.toString()}',
      );
    }
  }

  //--------------------------------------gender and age------------------------------------------------------//

  Future<void> updateGenderAndAgeRange({
    required String gender,
    required String ageRange,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception("User not logged in");
    }

    try {
      await supabase
          .from('user_profiles')
          .update({'gender': gender, 'age_range': ageRange})
          .eq('id', userId);
    } on PostgrestException catch (e) {
      throw Exception("Supabase Error: ${e.message} - ${e.details}");
    } on Exception catch (e) {
      throw Exception(
        "An unexpected error occurred during profile update: ${e.toString()}",
      );
    }
  }
}
