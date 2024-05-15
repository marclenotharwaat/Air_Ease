import 'package:airease/cubits/cancel_ticket_cubit/cancel_ticket_states.dart';
import 'package:airease/services/ticket_service/delet_ticket.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelTicketCubit extends Cubit<CancelTicketStates> {
  CancelTicketCubit() : super(NodateStates());

  CancelTicket(
      {required String kindOfTicket,
      required String ticketOwner,
      required String flight}) async {
    try {
      await DeletTicket().deletTicket(kindOfTicket, ticketOwner, flight);
      emit(SuccessCancelTicketStates());
    } catch (e) {
      emit(FailCancelTicketStates());
    }
  }
}
