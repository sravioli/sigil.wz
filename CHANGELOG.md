# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## [1.2.0](https://github.com/sravioli/sigil.wz/compare/3a1e7fba7629e61d49f15bdf4256673a347de187..1.2.0) - 2026-11-17
#### Features
- wrap the nerdfonts table with a broad icon catalogue - ([27b3e2f](https://github.com/sravioli/sigil.wz/commit/27b3e2f15edb0ec3b45e526d0b4cdc200840b444)) - sravioli
#### Bug Fixes
- (**config**) drop only the invalid options - ([85d8027](https://github.com/sravioli/sigil.wz/commit/85d8027ad9394900c8a99e559ffe8434491b7e88)) - sravioli
- (**registry**) match Windows .exe program names - ([56bd4cf](https://github.com/sravioli/sigil.wz/commit/56bd4cf1d32533123d87b707d56298ee50d7b1fd)) - sravioli
#### Documentation
- add minit.lua for reproducing bugs - ([3a1e7fb](https://github.com/sravioli/sigil.wz/commit/3a1e7fba7629e61d49f15bdf4256673a347de187)) - sravioli
#### Continuous Integration
- pass the release tag to the shell through env - ([9eba68a](https://github.com/sravioli/sigil.wz/commit/9eba68a34bb95f95b32255feffbb0a708b5cad33)) - sravioli
- release from the pushed tag - ([1d36b84](https://github.com/sravioli/sigil.wz/commit/1d36b84aea4c7c707206845454286b45696013e1)) - sravioli
- count only the plugin's own files in coverage - ([b73b2da](https://github.com/sravioli/sigil.wz/commit/b73b2dac1c9d40e7629080e85e4dbf90bbf52c53)) - sravioli
#### Refactoring
- (**registry**) call warp.filesystem.basename directly - ([dd4e336](https://github.com/sravioli/sigil.wz/commit/dd4e336b5f0c4797a23070c2705d945cb6a5e500)) - sravioli

- - -

## [1.1.0](https://github.com/sravioli/sigil.wz/compare/927c3a71aab35c5f6275b1f927ca55c5f3432a2c..1.1.0) - 2026-11-16
#### Features
- (**config**) validate options with warden - ([927c3a7](https://github.com/sravioli/sigil.wz/commit/927c3a71aab35c5f6275b1f927ca55c5f3432a2c)) - sravioli
#### Documentation
- (**contributing**) document the signed-commit requirement - ([495e6a2](https://github.com/sravioli/sigil.wz/commit/495e6a296462007c3754ff380b506cd0b321d193)) - sravioli
- (**contributing**) unify guides and templates - ([85594f1](https://github.com/sravioli/sigil.wz/commit/85594f1b553217896827a0d71e244456cac95098)) - sravioli
- (**readme**) unify badge style and add release badge - ([8a0e2a9](https://github.com/sravioli/sigil.wz/commit/8a0e2a9d4d968fe6600469e5e5564fd0d3806948)) - sravioli
- (**readme**) document option validation and checks - ([ed483a6](https://github.com/sravioli/sigil.wz/commit/ed483a6600836089b4e305b6a67b421979b4ef6f)) - sravioli
- document working-tree local checkout setup - ([9324187](https://github.com/sravioli/sigil.wz/commit/932418706354bdd9d10772ed3babb3d3fbcaf0e8)) - sravioli
#### Tests
- (**config**) cover option validation - ([60ab8fd](https://github.com/sravioli/sigil.wz/commit/60ab8fd202ed93c9fc16eb7dd10b07a7b80b5f60)) - sravioli
#### Continuous Integration
- (**tests**) clone warden.wz for specs - ([a6cdf81](https://github.com/sravioli/sigil.wz/commit/a6cdf819b6d0bc8eadcdcd9060416c15f5b199c4)) - sravioli
- build the API reference from a majority of three LuaLS runs - ([72306c6](https://github.com/sravioli/sigil.wz/commit/72306c631c651d1d2e83e935a345b57272f1bb73)) - sravioli
- update the actions to the versions Dependabot proposed - ([040e372](https://github.com/sravioli/sigil.wz/commit/040e37292e4ad34fe922594e261f2a99442a519c)) - sravioli
- pin StyLua to 2.6.0 - ([4d75670](https://github.com/sravioli/sigil.wz/commit/4d75670d8ed1cdc5bcc27c9f4003ee41f46c3263)) - sravioli
- fix the flaky API check and the EditorConfig rate limit - ([28ecc8b](https://github.com/sravioli/sigil.wz/commit/28ecc8be7006a298f0fa53f6c00675a923f81e61)) - sravioli
- bump the actions group with 7 updates (#3) - ([65d7b09](https://github.com/sravioli/sigil.wz/commit/65d7b09ab2c228c8875bf2c2295eed51e9cdb1a4)) - [@sravioli](https://github.com/sravioli)
- bump the actions group with 7 updates - ([651b5fc](https://github.com/sravioli/sigil.wz/commit/651b5fc8c738252015ff0e55c8da9dbe0d2de14e)) - dependabot[bot]

- - -

## [1.0.2](https://github.com/sravioli/sigil.wz/compare/29f1dcfaa67db5586fef83ada4acaba34db18bb3..1.0.2) - 2026-11-15
#### Performance Improvements
- (**bootstrap**) keep plugin list across reloads - ([2e5902a](https://github.com/sravioli/sigil.wz/commit/2e5902a7b57dc972c7f5751e1d4bf22b0462071f)) - sravioli
- (**bootstrap**) share plugin discovery snapshot - ([29f1dcf](https://github.com/sravioli/sigil.wz/commit/29f1dcfaa67db5586fef83ada4acaba34db18bb3)) - sravioli
- (**symbols**) cache merged symbol table - ([73a9d5b](https://github.com/sravioli/sigil.wz/commit/73a9d5b3a3f831eaa7ea5ea964e6e45747ea5895)) - sravioli
#### Documentation
- (**readme**) update plugin READMEs - ([413dea5](https://github.com/sravioli/sigil.wz/commit/413dea5fbe538702774a131b7c4a4c8dc1289dff)) - sravioli
- document Sigil config accessors - ([da5a6f1](https://github.com/sravioli/sigil.wz/commit/da5a6f173c776e4867b69f09b582d1121210fef6)) - sravioli
#### Tests
- (**symbols**) cover cache refresh and copies - ([1d4fb85](https://github.com/sravioli/sigil.wz/commit/1d4fb85af4295e00d2a4c3b9fcf1aabcbd282eb1)) - sravioli

- - -

## [1.0.1](https://github.com/sravioli/sigil.wz/compare/03f45cd7df6b71c5adebc8b87d84544ca172d248..1.0.1) - 2026-05-14
#### Documentation
- (**github**) add pull request templates - ([09d4eac](https://github.com/sravioli/sigil.wz/commit/09d4eac9fd90127d274d6d45949f127fb5e59666)) - sravioli
- (**github**) polish issue templates - ([9278692](https://github.com/sravioli/sigil.wz/commit/9278692805df9d0fe04af528fbebd78810d7d189)) - sravioli
- (**lua**) polish comment wording - ([cc182e9](https://github.com/sravioli/sigil.wz/commit/cc182e9d3113eec4dad685b5eef59c8e8c73e310)) - sravioli
- (**readme**) align documentation with implementation - ([f5dc225](https://github.com/sravioli/sigil.wz/commit/f5dc22531bb8205f6e1ead352890613d7a09af58)) - sravioli
- (**readme**) restore Awesome WezTerm badge - ([03f45cd](https://github.com/sravioli/sigil.wz/commit/03f45cd7df6b71c5adebc8b87d84544ca172d248)) - sravioli
#### Refactoring
- introduce deps.lua and delegate utilities to warp.wz - ([a4c183b](https://github.com/sravioli/sigil.wz/commit/a4c183bf228c8bddbd1239b280a3d4ab4583032b)) - sravioli

- - -

## [1.0.0](https://github.com/sravioli/sigil.wz/compare/facf019e771c31b3dda3c69fee230a9da2f9fc27..1.0.0) - 2026-05-10
#### Features
- (**defaults**) expand icon registry coverage - ([f7db68d](https://github.com/sravioli/sigil.wz/commit/f7db68d944144d7bea7b60eb9ed0cbb6acd322ac)) - sravioli
- (**defaults**) add more icon entries - ([3d28dad](https://github.com/sravioli/sigil.wz/commit/3d28dad52df57d2f81fa5c672e47d76de4ab7ab4)) - sravioli
- (**sigil**) add icon registry plugin - ([facf019](https://github.com/sravioli/sigil.wz/commit/facf019e771c31b3dda3c69fee230a9da2f9fc27)) - sravioli
#### Bug Fixes
- (**defaults**) use documented nerdfonts keys - ([39ef5aa](https://github.com/sravioli/sigil.wz/commit/39ef5aa03ccd1c4a91265583f56437ddc93f099c)) - sravioli
#### Documentation
- (**readme**) use standalone plugin imports - ([bd5b926](https://github.com/sravioli/sigil.wz/commit/bd5b92645b6c397c1ab00046efac9259b4d6ae94)) - sravioli
- (**readme**) hide pending upstream claims - ([ae1afa8](https://github.com/sravioli/sigil.wz/commit/ae1afa86fb919847ea59c1f747b1ce0b44b1f55e)) - sravioli
- (**readme**) improve usage clarity - ([e68d3b9](https://github.com/sravioli/sigil.wz/commit/e68d3b93b6507c652ba332a3f92af80bae832143)) - sravioli
#### Refactoring
- (**defaults**) split icon registry categories - ([61bac85](https://github.com/sravioli/sigil.wz/commit/61bac851a1c4588a9d6c89c9e77da47f0799309f)) - sravioli

- - -

Changelog generated by [cocogitto](https://github.com/cocogitto/cocogitto).