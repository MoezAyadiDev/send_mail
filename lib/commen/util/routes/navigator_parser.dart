import 'package:flutter/material.dart';
import 'package:send_mail/features/app/presentation/ui/bloc/route/route_cubit.dart';

class NavigatorParser extends RouteInformationParser<RouteState> {
  @override
  Future<RouteState> parseRouteInformation(
      RouteInformation routeInformation) async {
    return RouteState.splash();
  }

  @override
  RouteInformation restoreRouteInformation(RouteState path) {
    return const RouteInformation(location: "/");
  }
}
