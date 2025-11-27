import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> signOut();
  Stream<AuthState> get authStateStream;
  User? get currentUser;
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<void> signIn({required String email, required String password}) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.session == null) {
      throw AuthException('Authentication failed: No session returned');
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );
    if (response.session == null) {
      throw AuthException('Sign up failed: No session returned');
    }
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  @override
  Stream<AuthState> get authStateStream => _supabase.auth.onAuthStateChange;

  @override
  User? get currentUser => _supabase.auth.currentUser;
}
