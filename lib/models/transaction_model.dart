import 'package:bwa_travel_dan_pesawat/models/destinations_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationsModel destinations;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel(
      {required this.destinations,
      this.id = '',
      this.amountOfTraveler = 0,
      this.selectedSeats = '',
      this.insurance = false,
      this.refundable = false,
      this.vat = 0.0,
      this.price = 0,
      this.grandTotal = 0});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destinations: DestinationsModel.fromJson(json['destination']['id'], json['destination']),
        amountOfTraveler: json["amountOfTraveler"],
        selectedSeats: json['selectedSeats'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        destinations,
        amountOfTraveler,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal
      ];
}
