import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens_exports.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterScreen(),
  ),
  GoRoute(
    path: '/bloc',
    builder: (context, state) => const BlocCounterScreen(),
  ),
  GoRoute(
    path: '/form',
    builder: (context, state) => const FormScreen(),
  ),
]);
