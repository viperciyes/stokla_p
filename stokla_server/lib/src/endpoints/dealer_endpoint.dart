import 'package:serverpod/server.dart';
import '../generated/protocol.dart';

class DealerEndpoint extends Endpoint {
  Future<List<Dealer>> getAllDealers(Session session) async {
    return await Dealer.db.find(
      session,
      orderBy: (t) => t.id,
    );
  }

  Future<Dealer> createDealer(Session session, Dealer dealer) async {
    // Ensure createdAt and updatedAt are set
    dealer.createdAt = DateTime.now();
    dealer.updatedAt = DateTime.now();
    dealer.isDeleted = false; // Set isDeleted to false on creation
    var newDealer = await Dealer.db.insertRow(session, dealer);
    return newDealer;
  }

  Future<void> deleteDealer(Session session, int dealerId) async {
    var dealer = await Dealer.db.findById(session, dealerId);
    if (dealer == null) {
      throw Exception('Dealer not found');
    }
    dealer.isDeleted = true; // Soft delete the dealer
    dealer.deletedAt = DateTime.now(); // Set deletedAt timestamp
    await Dealer.db.updateRow(session, dealer);
  }

  Future<Dealer> updateDealer(Session session, Dealer dealer) async {
    print('called');
    print(dealer.toString());
    var existingDealer = await Dealer.db.findById(session, dealer.id!);
    if (existingDealer == null) {
      throw Exception('Dealer not found');
    }
    print('updating this one dealer');
    existingDealer.updatedAt = DateTime.now(); // Update the timestamp
    return await Dealer.db.updateRow(session, dealer);
  }
}
