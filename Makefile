routes:
	cd scripts && dart gen_routes.dart

vm:
	cd scripts && dart vm_gen.dart -n
	$(MAKE) routes

asset:
	cd scripts && dart gen_assets.dart