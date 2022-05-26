import 'package:synchronized/synchronized.dart';
import 'msg_model.dart';

class MsgBuffer {
  final Lock _lock = Lock();
  Map<String, MsgModel> buffer = {};
  void saveCopy(MsgModel msgModel) async {
    await _lock.synchronized(() => buffer[msgModel.id] = msgModel);
  }

  void deleteCopy(String id) async {
    await _lock.synchronized(() => buffer.remove(id));
  }

  Future<List<MsgModel>> getBufferContent() async {
    List<MsgModel> msgs = [];
    await _lock.synchronized(() => buffer.forEach((_, value) {
          msgs.add(value);
        }));
    return msgs;
  }
}
