// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/flightdata_cubit.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final flightCubit = context.read<FlightdataCubit>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flight Tracker"),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Flight Number Input
//             TextField(
//               onChanged: (value) {
//                 flightCubit.fetchFlightData(value);
//               },
//               decoration: const InputDecoration(
//                 labelText: "Enter Flight Number",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // BlocBuilder to react to state changes
//             BlocBuilder<FlightdataCubit, FlightdataState>(
//               builder: (context, state) {
//                 if (state is FlightDataLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is FlightDataLoaded) {
//                   return _buildFlightDetails(state.flightData);
//                 } else if (state is FlightDataError) {
//                   return Center(
//                     child: Text(
//                       state.error,
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                   );
//                 }
//                 return const Center(child: Text("Enter a flight number above."));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFlightDetails(FlightModel flightData) {
//     return Card(
//       margin: const EdgeInsets.only(top: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Flight: ${flightData.flightNumber}"),
//             Text("From: ${flightData.departureAirport}"),
//             Text("To: ${flightData.arrivalAirport}"),
//             Text("Status: ${flightData.status}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
