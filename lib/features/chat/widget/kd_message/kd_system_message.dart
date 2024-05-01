part of 'kd_message.dart';

class KdSystemMessage extends StatelessWidget {
  final bool isSession;
  const KdSystemMessage({super.key, this.isSession = false});

  @override
  Widget build(BuildContext context) {
    return (isSession)
        ? const SessionWidget()
        : const Center(
            child: Text('testing'),
          );
  }
}

class SessionWidget extends StatelessWidget {
  const SessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: KdColor.primary30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Session 1',
                style: KdTextStyles.caption2Regular.copyWith(
                  color: KdColor.neutral90,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: KdColor.primary10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Absensi Sesion 1',
                    style: KdTextStyles.body2Medium.copyWith(
                      color: KdColor.neutral90,
                    )),
                GestureDetector(
                  onTap: () {
                    debugPrint('ID SESSION 1');
                  },
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color(0xff4285F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Hadir',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
