import 'package:bloc/bloc.dart';
import 'package:bwa_travel_dan_pesawat/services/destinations_service.dart';
import 'package:equatable/equatable.dart';

import '../models/destinations_model.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void fetchDes() async {
    try{
      emit(DestinationsLoading());

      List<DestinationsModel> destinations = await DestinationsService().fetchDestinations();

      emit(DestinationsSuccess(destinations));
    } catch (e) {
      emit(DestinationsFailed(e.toString()));
    }
  }
}
