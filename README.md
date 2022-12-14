# P2HACKS2022 アピールシート 

### プロダクト名  
### 「DesNe」 

### コンセプト  
失望ワクチン～未来は君の思い通りじゃない～<br><br>
自分の怠惰さを自覚し、それに振り回されることを防ぐアプリ。

プロダクト名の由来...「Despir the next 絶望を次に活かす」<br>

### 対象ユーザ  
大学生（課題提出に難あり）  

### 利用の流れ  
- アプリの起動方法<br>
  1. githubをプルする。
  2. 「DesNe」フォルダを開き、「DesNe.pde」を起動。
  3. 左上の三角ボタンを押す。
  
- 想定する使用方法<br>
  1. 左下の追加ボタンから、タスク名・提出予定日・締切日を入力。
  2. アプリ側が、過去のタスク遂行状況から鑑みた信用度から、予想提出日を推測。

推しポイント  
- 対抗心を思う存分煽られる。
- タスクに対する姿勢が信用度として反映される。
- 人間の信用に近い予測の演算を実装

スクリーンショット(任意)
![2022-12-18_123516](https://user-images.githubusercontent.com/111856739/208280172-7d09590f-3d81-45fa-b869-8778a00533dc.png)

予想日時の推測・信用度更新のアルゴリズム
![bitmap](https://user-images.githubusercontent.com/111856739/208280536-e829f74a-3b5d-4b75-8849-35ae86fdaf29.png)

# 開発体制  

役割分担  
1. 全員でコンセプト構想
2. デザイン担当(2人)と設計担当(3人)で分担
3. 「ページのひな型」と「細かい処理の実装」に分担
   - デザイン担当...テキスト・図形を配置した各ページのひな型を作成、UX・アプリの意義について思案。
   - 設計担当...クラス設計、データの流れを考えた後、細かいクラスメソッドを定義、具体的な処理の実装。
4. ページごとに、ひな形と処理を合体させる。
   - ページごと（日付パネルのページ、入力ページ、タスクビューページ）に担当者を割り当てた。
5. すべてのページを一つのファイルに合体させる。
   - 一つのブランチで、担当者と話しながら実装。

開発における工夫した点  
- チームメンバー5人の中でも、スキルや作業できる時間に差があったため、それぞれに適した役割分担をした。
- コンフリクト対策のために関数、クラスごとにbranchを切って、基本的に同じファイルでの並行作業は避けた。
- 楽しく話す。

## 開発技術 

利用したプログラミング言語  
Processing

利用したフレームワーク・ライブラリ  
java.util.Calendar, javax.swing.JTextFieldなどのjavaの標準ライブラリ 

その他開発に使用したツール・サービス     
Git, GitHub ...コードの管理       
Discord,Slack ...コミュニケーション・画面共有用、情報共有用    
[Google Document](https://docs.google.com/document/d/1Ll4U0mxkzDm44R0HWg6R59Jcdg0Sg6zQNLpnZ3C2T2I/edit) ... 議事録、メモ     
[Google Spreadsheet](https://docs.google.com/spreadsheets/u/1/d/1XvWlb0A8xvIKXqqu6l4qAiA607tx2S2xZXSqNtNDWe0/edit?usp=sharing)...命名規則のまとめ      
[Microsft Visio](https://hakodate-my.sharepoint.com/:u:/g/personal/b1022230_fun_ac_jp/EU1-w_ULLQJCvUEidD92CT0BivcnRIeki8GWiCGOH1H0Bw?e=xioLZF)...クラス設計、データフローなど、設計に関するイメージの共有      
[Mindmenister](https://mm.tt/map/2526727627?t=1lYXHJufrV)...ブレインマップ     


