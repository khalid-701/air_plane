import 'package:bwa_travel_dan_pesawat/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> creatTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destinations.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }


  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transactions = result.docs
          .map((e) => TransactionModel.fromJson(
          e.id, e.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }

}
