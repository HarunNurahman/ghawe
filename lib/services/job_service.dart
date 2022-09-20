import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ghawe/models/jobs_model.dart';

class JobService {
  CollectionReference jobRef = FirebaseFirestore.instance.collection('jobs');

  Future<List<JobsModel>> fetchJob() async {
    try {
      QuerySnapshot result = await jobRef.get();
      List<JobsModel> jobList = result.docs.map((e) {
        return JobsModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return jobList;
    } catch (e) {
      rethrow;
    }
  }
}
