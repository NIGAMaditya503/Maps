import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/Services/trip.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  //collection ref
  final CollectionReference tripCollection = Firestore.instance.collection('trip');
  Future updateUserData(String Pickup, String Dropoff, String Number_of_Seats)async{
    return await tripCollection.document(uid).setData({
      'Pickup': Pickup,
      'Dropoff' : Dropoff,
      'Number of Seats': Number_of_Seats,
    });
  }

  // trip list from snapshot
  List<trip> _tripListfromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return trip(
        Pickup: doc.data['Pickoff'] ?? '',
        Dropoff: doc.data['Dropoff'] ?? '',
        Number_of_Seats: doc.data['Number of Seats'] ??  0,
      );
    }).toList();
  }

// get stream
Stream<List<trip>> get trips{
    return tripCollection.snapshots()
    .map(_tripListfromSnapshot);
}

}