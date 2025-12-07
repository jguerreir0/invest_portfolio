// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'quantity', '3': 4, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'current_price', '3': 5, '4': 1, '5': 1, '10': 'currentPrice'},
    {'1': 'change_percent', '3': 6, '4': 1, '5': 1, '10': 'changePercent'},
    {'1': 'weight', '3': 7, '4': 1, '5': 1, '10': 'weight'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoCVICaWQSFgoGc3ltYm9sGAIgASgJUgZzeW1ib2wSEgoEbmFtZR'
    'gDIAEoCVIEbmFtZRIaCghxdWFudGl0eRgEIAEoAVIIcXVhbnRpdHkSIwoNY3VycmVudF9wcmlj'
    'ZRgFIAEoAVIMY3VycmVudFByaWNlEiUKDmNoYW5nZV9wZXJjZW50GAYgASgBUg1jaGFuZ2VQZX'
    'JjZW50EhYKBndlaWdodBgHIAEoAVIGd2VpZ2h0');

@$core.Deprecated('Use portfolioOverviewDescriptor instead')
const PortfolioOverview$json = {
  '1': 'PortfolioOverview',
  '2': [
    {'1': 'assets', '3': 1, '4': 3, '5': 11, '6': '.portfolio.Asset', '10': 'assets'},
    {'1': 'total_value', '3': 2, '4': 1, '5': 1, '10': 'totalValue'},
    {'1': 'daily_change_percent', '3': 3, '4': 1, '5': 1, '10': 'dailyChangePercent'},
  ],
};

/// Descriptor for `PortfolioOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioOverviewDescriptor = $convert.base64Decode(
    'ChFQb3J0Zm9saW9PdmVydmlldxIoCgZhc3NldHMYASADKAsyEC5wb3J0Zm9saW8uQXNzZXRSBm'
    'Fzc2V0cxIfCgt0b3RhbF92YWx1ZRgCIAEoAVIKdG90YWxWYWx1ZRIwChRkYWlseV9jaGFuZ2Vf'
    'cGVyY2VudBgDIAEoAVISZGFpbHlDaGFuZ2VQZXJjZW50');

@$core.Deprecated('Use timeSeriesPointDescriptor instead')
const TimeSeriesPoint$json = {
  '1': 'TimeSeriesPoint',
  '2': [
    {'1': 'timestamp_ms', '3': 1, '4': 1, '5': 3, '10': 'timestampMs'},
    {'1': 'value', '3': 2, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `TimeSeriesPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeSeriesPointDescriptor = $convert.base64Decode(
    'Cg9UaW1lU2VyaWVzUG9pbnQSIQoMdGltZXN0YW1wX21zGAEgASgDUgt0aW1lc3RhbXBNcxIUCg'
    'V2YWx1ZRgCIAEoAVIFdmFsdWU=');

@$core.Deprecated('Use portfolioTimeSeriesResponseDescriptor instead')
const PortfolioTimeSeriesResponse$json = {
  '1': 'PortfolioTimeSeriesResponse',
  '2': [
    {'1': 'points', '3': 1, '4': 3, '5': 11, '6': '.portfolio.TimeSeriesPoint', '10': 'points'},
  ],
};

/// Descriptor for `PortfolioTimeSeriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioTimeSeriesResponseDescriptor = $convert.base64Decode(
    'ChtQb3J0Zm9saW9UaW1lU2VyaWVzUmVzcG9uc2USMgoGcG9pbnRzGAEgAygLMhoucG9ydGZvbG'
    'lvLlRpbWVTZXJpZXNQb2ludFIGcG9pbnRz');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use healthCheckResponseDescriptor instead')
const HealthCheckResponse$json = {
  '1': 'HealthCheckResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `HealthCheckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckResponseDescriptor = $convert.base64Decode(
    'ChNIZWFsdGhDaGVja1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVz');

