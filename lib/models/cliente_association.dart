import 'package:banco/models/cliente_models.dart';
import 'package:banco/models/conta_models.dart';

class ClienteContaAssociation {
  String id;
  Cliente cliente;
  Conta conta;

  ClienteContaAssociation(this.cliente, this.conta, this.id);
}
