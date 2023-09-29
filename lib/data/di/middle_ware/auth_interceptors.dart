import 'package:dio/dio.dart';

import 'base_interceptors.dart';

class AuthInterceptor extends BaseInterceptors {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //TODO
    const accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Im15LWtleS1pZCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiVTEyMDI1NTUwMTA1IiwiVXNlcklEIjoiODEzMDkyMDIyMDgwOTQ0IiwiRGV2aWNlQ29kZSI6ImRlbW8xIiwiRGV2aWNlSWQiOiI5MDcwOTIwMjMwODA5MTkiLCJ0b2tlbi5jcmVhdGVkYXRlIjoiMDkvMTUvMjAyMyAwODoxNzozMCIsImp0aSI6IjE1NTk4IiwiVG9rZW5BZG1pbk1vZGUiOiJGYWxzZSIsIlBob25lTnVtYmVyIjoiKzEyMDI1NTUwMTA1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTY5NTM3MDY1MH0.DNhFVJAT68QPAeYOHXDtYvMe_9BmVVJGCeJ9MZ9GthZo7PyyuG8ay_UiztgFf0B05HclsD9Kzn1nVp4hGFHCGU-ojZRwjQFcmdebqgtjkav4Nblgo_caXkWZWfMzFf_YG6hnFYQYY81H0BGgsL0656UFJOP4pUiDKQCVmeGKpwbScF4t8-p7LizQ97rJ9AM5MVktikKj6knVRLMgNw_Ys1DPaPNy5oAD9x7oUtd7fdaUsIXQLEiHBgjioHRe2ux3aX_AzEB-txGh0icraiZYdgawPdpzzHzfTCygpZNR8Do6wE-ZOqi7JH0mU3rjYE9CUv6ofYwXlnFeHM9daaNKfw';
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }
}
