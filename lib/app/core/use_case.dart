import 'package:clean_architecture_poc/app/core/custom_failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<P, S> {
  Future<Either<CustomFailure, S>> call({required P params});
}
