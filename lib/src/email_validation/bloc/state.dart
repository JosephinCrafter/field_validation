part of 'bloc.dart';

final class EmailState extends Equatable {
  const EmailState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Email email;
  final bool isValid;

  EmailState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    bool? isValid,
  }) {
    return EmailState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, email];
}
