import 'package:equatable/equatable.dart';
import 'package:field_validation/src/email_validation/model/email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'event.dart';
part 'state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(const EmailState()) {
    on<EmailChanged>(_onEmailChanged);
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<EmailState> emit,
  ) {
    final email = Email.dirty(value: event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            state.email,
          ],
        ),
      ),
    );
  }
}
