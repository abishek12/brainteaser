import '../../dashboard/screen/dashboard_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../quiz/screen/quiz_screen.dart';

final List screenList = [
  {
    'title': 'Home',
    'screen': const HomeScreen(),
  },
  {
    'title': 'Quiz',
    'screen': const QuizScreen(),
  },
  {
    'title': 'Dashboard',
    'screen': const DashboardScreen(),
  },
];
