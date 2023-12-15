import 'package:field_validation/src/email_validation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailValidation extends StatelessWidget {
  const EmailValidation({
    super.key,
    this.autofillHints,
    this.labelText,
    this.border,
  });

  final List<String>? autofillHints;
  final String? labelText;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailBloc>(
      create: (context) => EmailBloc(),
      child: Builder(
        builder: (context) => BlocBuilder<EmailBloc, EmailState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return Container(
              child: TextField(
                // Add a new [EmailChanged] event to the bloc to trigger checking
                // if the mail is correct or not.
                onChanged: (email) => context.read<EmailBloc>().add(
                      EmailChanged(email),
                    ),
                autocorrect: false,
                autofillHints: autofillHints ?? const ["email"],
                decoration: InputDecoration(
                  labelText: labelText ?? "Email",
                  border: border ?? const OutlineInputBorder(),
                  errorText: state.email.displayError != null
                      ? 'Invalid e-mail'
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
