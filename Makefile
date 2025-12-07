open_coverage:
	@if command -v open >/dev/null 2>&1; then \
		open coverage/html/index.html; \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open coverage/html/index.html; \
	else \
		echo "Please open coverage/html/index.html manually."; \
	fi


test_coverage: 
	flutter test --coverage
	lcov --remove coverage/lcov.info 'lib/**/generated/**' -o coverage/lcov.cleaned.info
	genhtml coverage/lcov.cleaned.info -o coverage/html
	make open_coverage

run_server:
	dart run bin/portfolio_server.dart

get_packages:
	PUB_HOSTED_URL=https://pub.dev flutter pub get

generate_protos:
	protoc \
  	--dart_out=grpc:lib/src/generated \
  	-Iprotos protos/portfolio.proto

