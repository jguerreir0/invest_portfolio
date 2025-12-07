// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'portfolio.pb.dart' as $0;

export 'portfolio.pb.dart';

@$pb.GrpcServiceName('portfolio.PortfolioService')
class PortfolioServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PortfolioServiceClient(super.channel, {super.options, super.interceptors});

  /// unary – snapshot
  $grpc.ResponseFuture<$0.PortfolioOverview> getOverview($0.Empty request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getOverview, request, options: options);
  }

  $grpc.ResponseFuture<$0.PortfolioTimeSeriesResponse> getTimeSeries($0.Empty request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getTimeSeries, request, options: options);
  }

  /// streaming – live feed
  $grpc.ResponseStream<$0.PortfolioOverview> streamOverview($0.Empty request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$streamOverview, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.HealthCheckResponse> healthCheck($0.Empty request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$healthCheck, request, options: options);
  }

    // method descriptors

  static final _$getOverview = $grpc.ClientMethod<$0.Empty, $0.PortfolioOverview>(
      '/portfolio.PortfolioService/GetOverview',
      ($0.Empty value) => value.writeToBuffer(),
      $0.PortfolioOverview.fromBuffer);
  static final _$getTimeSeries = $grpc.ClientMethod<$0.Empty, $0.PortfolioTimeSeriesResponse>(
      '/portfolio.PortfolioService/GetTimeSeries',
      ($0.Empty value) => value.writeToBuffer(),
      $0.PortfolioTimeSeriesResponse.fromBuffer);
  static final _$streamOverview = $grpc.ClientMethod<$0.Empty, $0.PortfolioOverview>(
      '/portfolio.PortfolioService/StreamOverview',
      ($0.Empty value) => value.writeToBuffer(),
      $0.PortfolioOverview.fromBuffer);
  static final _$healthCheck = $grpc.ClientMethod<$0.Empty, $0.HealthCheckResponse>(
      '/portfolio.PortfolioService/HealthCheck',
      ($0.Empty value) => value.writeToBuffer(),
      $0.HealthCheckResponse.fromBuffer);
}

@$pb.GrpcServiceName('portfolio.PortfolioService')
abstract class PortfolioServiceBase extends $grpc.Service {
  $core.String get $name => 'portfolio.PortfolioService';

  PortfolioServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PortfolioOverview>(
        'GetOverview',
        getOverview_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PortfolioOverview value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PortfolioTimeSeriesResponse>(
        'GetTimeSeries',
        getTimeSeries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PortfolioTimeSeriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PortfolioOverview>(
        'StreamOverview',
        streamOverview_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PortfolioOverview value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.HealthCheckResponse>(
        'HealthCheck',
        healthCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PortfolioOverview> getOverview_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getOverview($call, await $request);
  }

  $async.Future<$0.PortfolioOverview> getOverview($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.PortfolioTimeSeriesResponse> getTimeSeries_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getTimeSeries($call, await $request);
  }

  $async.Future<$0.PortfolioTimeSeriesResponse> getTimeSeries($grpc.ServiceCall call, $0.Empty request);

  $async.Stream<$0.PortfolioOverview> streamOverview_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async* {
    yield* streamOverview($call, await $request);
  }

  $async.Stream<$0.PortfolioOverview> streamOverview($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.HealthCheckResponse> healthCheck_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return healthCheck($call, await $request);
  }

  $async.Future<$0.HealthCheckResponse> healthCheck($grpc.ServiceCall call, $0.Empty request);

}
