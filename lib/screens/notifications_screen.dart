// import 'package:flutter/material.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'package:travella/widgets/EmptyNotificationsScreen.dart';

// class NotificationsScreen extends StatefulWidget {
//   const NotificationsScreen({super.key});

//   @override
//   State<NotificationsScreen> createState() => _NotificationsScreenState();
// }

// class _NotificationsScreenState extends State<NotificationsScreen> {
//   final DioClient _dioClient = DioClient();
//   late Future<List<Map<String, dynamic>>> _notificationsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _notificationsFuture = _dioClient.getNotifications();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'Notifications',
//           style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const EmptyNotificationsScreen()),
//               );
//             },
//             child: const Text(
//               'Clear',
//               style: TextStyle(
//                   color: Color.fromARGB(255, 11, 10, 10),
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: FutureBuilder<List<Map<String, dynamic>>>(
//             future: _notificationsFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return const Center(
//                     child: Text(
//                   'No notifications available',
//                   style: TextStyle(color: Colors.grey),
//                 ));
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     final notification = snapshot.data![index];
//                     return _buildNotificationItem(
//                       title: notification['message'] ?? 'No Title',
//                       time: _formatTime(notification['createdAt']),
//                       isRead: notification['isRead'] ?? false,
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNotificationItem({
//     required String title,
//     required String time,
//     required bool isRead,
//   }) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6.0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 2,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: isRead
//                 ? [Colors.grey[200]!, Colors.grey[300]!]
//                 : [Color(0xFFECF4F9), Color(0xFFADD8E6)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: ListTile(
//           contentPadding: const EdgeInsets.all(12.0),
//           leading: CircleAvatar(
//             backgroundColor: isRead ? Colors.grey[400] : Color(0xFF406F89),
//             child:
//                 const Icon(Icons.notifications, color: Colors.white, size: 20),
//           ),
//           title: Text(
//             title,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: isRead ? Colors.black54 : Colors.black87,
//               fontSize: 16,
//             ),
//           ),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 4),
//               Text(
//                 time,
//                 style: TextStyle(
//                   color: isRead ? Colors.grey[700] : Colors.grey[800],
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//           trailing: isRead
//               ? const Icon(Icons.check_circle, color: Colors.green, size: 18)
//               : null,
//         ),
//       ),
//     );
//   }

//   String _formatTime(String? createdAt) {
//     if (createdAt == null) return 'Unknown time';
//     final datePart = createdAt.split('T')[0];
//     return datePart;
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'package:apptravella/widgets/EmptyNotificationsScreen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final DioClient _dioClient = DioClient();
  late Future<List<Map<String, dynamic>>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _dioClient.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmptyNotificationsScreen()),
              );
            },
            child: const Text(
              'Clear',
              style: TextStyle(
                  color: Color.fromARGB(255, 11, 10, 10),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _notificationsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text(
                  'No notifications available',
                  style: TextStyle(color: Colors.grey),
                ));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final notification = snapshot.data![index];
                    final id = notification['id'] as int? ?? index;
                    return _buildNotificationItem(
                      title: notification['message'] ?? 'No Title',
                      time: _formatTime(notification['createdAt']),
                      isRead: notification['isRead'] ?? false,
                      onMarkAsRead: () => _markAsRead(id),
                      onDelete: () => _deleteNotification(id),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String time,
    required bool isRead,
    required VoidCallback onMarkAsRead,
    required VoidCallback onDelete,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isRead
                ? [Colors.grey[200]!, Colors.grey[300]!]
                : [Color(0xFFECF4F9), Color(0xFFADD8E6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12.0),
          leading: CircleAvatar(
            backgroundColor: isRead ? Colors.grey[400] : Color(0xFF406F89),
            child:
                const Icon(Icons.notifications, color: Colors.white, size: 20),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isRead ? Colors.black54 : Colors.black87,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  color: isRead ? Colors.grey[700] : Colors.grey[800],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isRead)
                IconButton(
                  icon: const Icon(Icons.done, color: Colors.green),
                  onPressed: onMarkAsRead,
                ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _markAsRead(int id) async {
    try {
      await _dioClient.markNotificationAsRead(id);
      setState(() {
        _notificationsFuture = _dioClient.getNotifications();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to mark as read: $e')),
      );
    }
  }

  Future<void> _deleteNotification(int id) async {
    try {
      await _dioClient.deleteNotification(id);
      setState(() {
        _notificationsFuture = _dioClient.getNotifications();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete: $e')),
      );
    }
  }

  String _formatTime(String? createdAt) {
    if (createdAt == null) return 'Unknown time';
    final datePart = createdAt.split('T')[0];
    return datePart;
  }
}
