class SplashService {
  Future<bool> checkState() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
