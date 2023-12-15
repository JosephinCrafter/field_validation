part of 'bloc.dart';

sealed class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

/// Event object that represent the email change
final class EmailChanged extends EmailEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}
