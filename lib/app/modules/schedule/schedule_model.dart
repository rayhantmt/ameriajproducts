

class ScheduleModel {
 final String tittle;
 final String details;
 final String time;
 final String location;

  ScheduleModel({
    required this.tittle,
    required this.details,
    required this.time,
    required this.location,
  });
}
class scheduledata{
  final List<ScheduleModel> sdata=[
    ScheduleModel(tittle: 'Dental Appointment', details: 'Clinic #3', time: '1:00 PM', location: 'Medical Wing'),
    ScheduleModel(tittle: 'Physical Fitness Review', details: 'Sgt. Johnson', time: '2:00 PM', location: 'Traning Center'),
    ScheduleModel(tittle: 'Physical Fitness Review', details: 'Sgt. Johnson', time: '3:00 PM', location: 'Traning Center'),
    ScheduleModel(tittle: 'Physical Fitness Review', details: 'Sgt. Johnson', time: '4:00 PM', location: 'Traning Center')
  ]     
  
  ;
}