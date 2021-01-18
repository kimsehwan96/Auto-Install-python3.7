# 파이썬 자동 설치 스크립트

- 리눅스 환경에서 특정 파이썬 버전을 자동 설치하는 스크립트입니다.

- 파이썬 소스를 wget 하여 타겟 머신에서 빌드하고, 설치하는 자동화 스크립트입니다.

- 기존 설치 방법을 이용하면 `python3` 의 `ssl` 모듈이 에러(미설치)나는 경우가 있습니다.
- 이를 방지하기 위해 `ssl` 모듈을 설치하도록 파이썬 소스의 `Modules/Setup.dist` 의 특정 행을 주석 해제를 자동으로 합니다.

## 사용법

1. `git clone https://github.com/kimsehwan96/Auto-Install-python3.7.git`
2. `cd Auto-Install-python3.7`
3. `sudo chmod +x install.sh`
4. `sudo ./install.sh`

- 설치 완료 이후 Auto-Install-python3.7 디렉터리를 삭제하면 됩니다.

## 주의사항

- 기본 python3 에 대한 심벌릭 링크를 현재 설치하는 python3.7.2 에대해서 걸게 됩니다.

## 향후 업데이트 할 내용

- 사용자로부터 원하는 파이썬 버전을 입력받아 해당 버전을 설치하도록 수정
