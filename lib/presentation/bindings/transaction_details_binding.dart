import 'package:get/get.dart';
import 'package:money_app/data/local_storage/local_storage.dart';
import 'package:money_app/data/repositories/account_repository.dart';
import 'package:money_app/data/repositories/transactions_repository.dart';
import 'package:money_app/domain/repositories/account_repository_impl.dart';
import 'package:money_app/domain/repositories/transactions_repository_impl.dart';
import 'package:money_app/presentation/ui/transaction_details/transaction_details_controller.dart';

class TransactionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRepository>(
      () => AccountRepositoryImpl(

        Get.find<LocalStorage>(),
      ),
      fenix: true,
    );
    Get.lazyPut<TransactionsRepository>(
      () => TransactionsRepositoryImpl(

        Get.find<LocalStorage>(),
      ),
      fenix: true,
    );
    Get.put(
      TransactionDetailsController(
        Get.find<AccountRepository>(),
        Get.find<TransactionsRepository>(),
      ),
    );
  }
}
