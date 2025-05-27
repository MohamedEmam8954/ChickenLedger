import 'package:go_router/go_router.dart';

navToWithoutBack(context, String location) {
  GoRouter.of(context).pushReplacement(location);
}

navToWithBack(context, String location, {Object? extra}) {
  GoRouter.of(context).push(location, extra: extra);
}

popFromScreen(context) {
  GoRouter.of(context).pop();
}
