################################################################################################
## 環境変数 flavor
################################################################################################
DEV_FLAVOR := dev
PROD_FLAVOR := prod

################################################################################################
## 基本コマンド
################################################################################################
# help
.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup:  ## setup
	dart pub global activate fvm
	fvm install
	yarn install

.PHONY: dependencies
dependencies: ## packages install
	fvm flutter pub get

.PHONY: upgrade
upgrade: ## packages upgrade
	fvm flutter packages upgrade

.PHONY: clean
clean: ## packages clean
	fvm flutter clean


.PHONY: format
format: ## code format
	fvm flutter format lib/


.PHONY: analyze
analyze: ## code analyze
	fvm flutter analyze

.PHONY: l10n
l10n: ## l10n generate
	fvm flutter gen-l10n

.PHONY: build-runner
build-runner: ## code generate
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch: ## code generate watch
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

.PHONY: test
test: ## run test
	fvm flutter test


################################################################################################
## 実行・ビルド
################################################################################################
.PHONY: run-dev
run-dev: ## run dev
	fvm flutter run --dart-define=FLAVOR=${DEV_FLAVOR} --target lib/main.dart

.PHONY: run-dev-preview
run-dev-preview: ## run dev (with Device Preview)
	fvm flutter run --dart-define=FLAVOR=${DEV_FLAVOR} --dart-define=PREVIEW=true --target lib/main.dart

.PHONY: run-prod
run-prod: ## run prod
	fvm flutter run --release --dart-define=FLAVOR=${PROD_FLAVOR} --target lib/main.dart

.PHONY: build-android-dev
build-android-dev: ## build APK dev
	fvm flutter build apk --dart-define=FLAVOR=$(DEV_FLAVOR) --target lib/main.dart

.PHONY: build-android-prod
build-android-prod: ## build APK prod
	fvm flutter build apk --release --dart-define=FLAVOR=$(PROD_FLAVOR) --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev: ## build IOS dev
	fvm flutter build ios --dart-define=FLAVOR=$(DEV_FLAVOR) --target lib/main.dart

.PHONY: build-ios-prod
build-ios-prod: ## build IOS prod
	fvm flutter build ios --release --dart-define=FLAVOR=$(PROD_FLAVOR) --target lib/main.dart
