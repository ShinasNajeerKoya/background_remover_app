br:
	@echo "🧹 Cleaning Runner..."
	dart run build_runner clean

	@echo "📦 Getting Runner..."
	dart run build_runner build --delete-conflicting-outputs


app:
	flutter clean; \
	flutter pub get; \
	cd ios && pod deintegrate && pod install --repo-update; \
	cd ..; \
	flutter build apk; \
	cd build/app/outputs/flutter-apk && open .


feature:
	fvm flutter pub run tool/feature_generator.dart



pipeline:
	@echo "🧹 Cleaning Flutter project..."
	flutter clean

	@echo "📦 Getting Flutter dependencies..."
	flutter pub get

	@echo "🔧 Reinstalling CocoaPods..."
	cd ios && pod deintegrate && pod install --repo-update


	@bash -c '\
		printf "💻  What are you committing ❓  "; \
		read msg; \
		echo "📌 Committing and pushing current branch to remote '\''ci/release-builds'\''..."; \
		git add .; \
		if ! git diff --cached --quiet; then \
			git commit -m "$$msg"; \
			git push origin HEAD:ci/release-builds; \
		else \
			echo "✅ No changes to commit."; \
		fi'

text:
	flutter pub get;\
	dart run easy_localization:generate -S "assets/languages" -o "locale_keys.g.dart" -f keys;\
	dart run build_runner build --delete-conflicting-outputs ;\
