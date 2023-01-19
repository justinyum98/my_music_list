import 'package:flutter_test/flutter_test.dart';
import 'package:my_music_list/screens/signin_screen.dart';

void main() {
  testWidgets('SignInScreen renders a title and sign in button', (tester) async {
    // ARRANGE
    await tester.pumpWidget(SignInScreen(onSignIn: (user) {},));

    // ACT
    final appTitleFinder = find.text('MyMusicList');
    final signInButtonFinder = find.text('Sign in with Google');

    // ASSERT
    expect(appTitleFinder, findsOneWidget);
    expect(signInButtonFinder, findsOneWidget);
  });


}
