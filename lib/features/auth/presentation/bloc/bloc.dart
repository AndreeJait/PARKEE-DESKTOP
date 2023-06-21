import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:parkee_app/cores/data/dto/dto.dart';
import 'package:parkee_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:parkee_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../cores/utils/exception.dart';
import '../../../../cores/utils/util.dart';



part 'bloc.g.dart';
part 'auth_bloc.dart';
part 'event.dart';
part 'state.dart';
