import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MlModel {
  getAndSendToModel() async {
    final MODEL_PATH = dotenv.get('MODEL_PATH');
    final url = Uri.parse(MODEL_PATH);
    final response = await http.post(url);
  }
}

// payload = {
//     "name": "name",
//     "description": "description",
//     "users": [
//         {
//             "user": "username",
//             "role": "admin" // or "write" or "read"
//         }
//     ],
//     "repos": [
//         {
//             "type": "dataset",
//             "name": "huggingface/repo"
//         }
//     ]
// }
