import 'package:arrivo_frond_end_assignment/screen/home/bloc/slide_bar_bloc/event/slide_bar_event.dart';
import 'package:arrivo_frond_end_assignment/screen/home/bloc/slide_bar_bloc/state/slide_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidebarMenuBloc extends Bloc<SidebarMenuEvent, SidebarMenuState> {
  SidebarMenuBloc() : super(SidebarMenuInitial()) {
    on<FetchSidebarMenuEvent>(
      (_, emit) async {
        try {
          emit(SidebarMenuSuccess(_.menu!));
        } catch (e) {
          emit(
            SidebarMenuError(e.toString()),
          );
        }
      },
    );
    on<TestEvent>((_, emit) {
      print('here');
    });
  }
}
