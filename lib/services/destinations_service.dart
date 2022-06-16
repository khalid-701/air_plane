import 'package:bwa_travel_dan_pesawat/models/destinations_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationsService {
  CollectionReference _destinationsRef =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationsModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _destinationsRef.get();

      List<DestinationsModel> destinations = result.docs
          .map((e) => DestinationsModel.fromJson(
              e.id, e.data() as Map<String, dynamic>))
          .toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
