<!-- 首页背景动画 -->
<template>
	<view class="bg-container">
		<div class="sky">
			<div class="deep_sky"></div>
		</div>
		<div class="c1">
			<div class="cloud"></div>
		</div>
		<div class="c2">
			<div class="cloud"></div>
		</div>
		<div class="c3">
			<div class="cloud"></div>
		</div>
		<div class="mountain_a"></div>
		<div class="mountain_b"></div>
		<div class="house right">
			<div class="fence"></div>
			<div class="wall"></div>
			<div class="roof left"></div>
			<div class="roof right"></div>
			<div class="door"></div>
		</div>
		<div class="house left">
			<div class="fence"></div>
			<div class="wall"></div>
			<div class="roof left"></div>
			<div class="roof right"></div>
			<div class="door"></div>
		</div>
		<div class="tree_back"></div>
		<div class="tree"></div>
		<div class="postbox_a">
			<div class="hole"></div>
		</div>
		<div class="postbox_b">
			<div class="hole"></div>
		</div>
		<div class="windmill">
			<div class="tower"></div>
			<div class="t1"></div>
			<div class="t2"></div>
			<div class="blade">
				<div class="windblade"></div>
				<div class="windblade windblade2"></div>
				<div class="windblade windblade3"></div>
				<div class="windblade windblade4"></div>
			</div>
		</div>
		<div class="allsnows">
			<div class="snow1"></div>
			<div class="snow2"></div>
			<div class="snow3"></div>
			<div class="snow4"></div>
			<div class="snow5"></div>
			<div class="snow6"></div>
			<div class="snow7"></div>
			<div class="snow8"></div>
			<div class="snow9"></div>
			<div class="snow10"></div>
			<div class="snow11"></div>
			<div class="snow12"></div>
			<div class="snow13"></div>
			<div class="snow14"></div>
			<div class="snow15"></div>
			<div class="snow16"></div>
			<div class="snow17"></div>
			<div class="snow18"></div>
			<div class="snow19"></div>
			<div class="snow20"></div>
		</div>
		<div class="ground">
			<div class="g1"></div>
			<div class="g2"></div>
			<div class="g3"></div>
			<div class="ice">
				<div class="glare"></div>
				<div class="ice_shadow"></div>
			</div>

		</div>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {

		}
	}
</script>

<style lang="scss">
	/*If you want to post these css code on other website, please type my name and codepen link behind the code. Thanks :) */

	/*如要轉出codepen外的網站，請附上作者名稱，以及這裡的網址，感謝配合 :) */
	.bg-container {
		width: 100%;
		height: 100vh;
		position: absolute;
	}

	body {
		background: #ade3e3;
		margin: 0;
		/*背景填滿無邊界*/
		overflow: hidden;
		/*讓物件跑出背景時不會出現捲軸*/
	}

	/*------------天空------------*/

	/*天空第一層*/
	.sky {
		position: absolute;
		background: #96dada;
		width: 100%;
		height: 200px;
		z-index: -2;
	}

	/*天空第二層*/
	.deep_sky {
		position: absolute;
		background: #78c7c7;
		width: 100%;
		height: 100px;
	}

	/*天空第三層*/
	.deep_sky:before {
		content: "";
		position: absolute;
		background: #5fb4b4;
		width: 100%;
		height: 30px;
	}

	/*------------地面------------*/

	/*地層*/
	.ground {
		position: absolute;
		background: #a2e6cf;
		width: 100%;
		height: 180px;
		bottom: 0;
	}

	/*冰面*/
	.ice {
		position: absolute;
		background: #c7ede0;
		width: 100%;
		height: 40px;
	}

	/*冰面反光線*/
	.glare {
		position: absolute;
		background: #ffffff;
		width: 95%;
		height: 10px;
		top: 0;
	}

	/*冰面反光第一層-仿像素畫效果*/
	.glare:before {
		content: "";
		position: absolute;
		background: #c7ede0;
		width: 10px;
		height: 10px;
		bottom: 0;
		left: 40%;
		box-shadow: -10px 0px 0px #e3f7f0, 5px 0px 0px #c7ede0, 10px 0px 0px #c7ede0, 15px 0px 0px #c7ede0, 20px 0px 0px #c7ede0, 25px 0px 0px #c7ede0, 30px 0px 0px #c7ede0, 35px 0px 0px #c7ede0, 40px 0px 0px #c7ede0, -140px 10px 0px #e3f7f0, -150px 10px 0px #ffffff, -155px 10px 0px #ffffff, -160px 10px 0px #ffffff, -165px 10px 0px #ffffff, -170px 10px 0px #ffffff, -175px 10px 0px #ffffff, -180px 10px 0px #ffffff, -185px 10px 0px #ffffff, -190px 10px 0px #ffffff, -195px 10px 0px #ffffff, -200px 10px 0px #ffffff, -180px 20px 0px #e3f7f0, -280px 10px 0px #e3f7f0, -290px 10px 0px #ffffff, -295px 10px 0px #ffffff, -300px 10px 0px #ffffff, -305px 10px 0px #ffffff, -310px 10px 0px #ffffff, -315px 10px 0px #ffffff, -320px 10px 0px #ffffff, -325px 10px 0px #ffffff, -330px 10px 0px #ffffff, -335px 10px 0px #ffffff, -340px 10px 0px #ffffff, -345px 10px 0px #ffffff, -350px 10px 0px #ffffff;
	}

	/*冰面反光第二層-仿像素畫效果*/
	.glare:after {
		content: "";
		position: absolute;
		background: #c7ede0;
		width: 10px;
		height: 10px;
		bottom: 0;
		right: 0;
		box-shadow: -10px 0px 0px #e3f7f0, -200px 0px 0px #c7ede0, -205px 0px 0px #c7ede0, -210px 0px 0px #c7ede0, -215px 0px 0px #c7ede0, -220px 0px 0px #c7ede0, -225px 0px 0px #c7ede0, -230px 0px 0px #c7ede0, -240px 0px 0px #e3f7f0, -250px 0px 0px #c7ede0, -255px 0px 0px #c7ede0, -260px 0px 0px #c7ede0, -270px 0px 0px #e3f7f0, -120px 10px 0px #e3f7f0, -130px 10px 0px #ffffff, -135px 10px 0px #ffffff, -140px 10px 0px #ffffff, -145px 10px 0px #ffffff, -150px 10px 0px #ffffff, -350px 10px 0px #e3f7f0, -360px 10px 0px #ffffff, -365px 10px 0px #ffffff, -370px 10px 0px #ffffff, -375px 10px 0px #ffffff, -380px 10px 0px #ffffff, -385px 10px 0px #ffffff, -390px 10px 0px #ffffff, -395px 10px 0px #ffffff, -400px 10px 0px #ffffff, -405px 10px 0px #ffffff, -410px 10px 0px #ffffff
	}

	/*冰面陰影線*/
	.ice_shadow {
		display: none;
		position: absolute;
		background: #84bba8;
		width: 100%;
		height: 10px;
		bottom: -10px;
	}

	/*冰面陰影第一層-仿像素畫效果*/
	.ice_shadow:before {
		content: "";
		position: absolute;
		background: #a2d1c1;
		width: 10px;
		height: 10px;
		bottom: 0;
		left: 20%;
		box-shadow: 10px 0px 0px #a3e2cd, 95px -10px 0px #84bba8, 100px -10px 0px #84bba8, 105px -10px 0px #84bba8, 110px -10px 0px #84bba8, 115px -10px 0px #84bba8, 120px -10px 0px #84bba8, 125px -10px 0px #84bba8, 130px -10px 0px #84bba8, 135px -10px 0px #a2d1c1, 140px -10px 0px #a2d1c1, 400px 0px 0px #a2d1c1, 410px 0px 0px #a3e2cd;
	}

	/*冰面陰影第二層-仿像素畫效果*/
	.ice_shadow:after {
		content: "";
		position: absolute;
		background: #84bba8;
		width: 20px;
		height: 10px;
		bottom: 10px;
		right: 10%;
		box-shadow: 10px 0px 0px #a2d1c1, -20px 0px 0px #84bba8, -140px 0px 0px #84bba8, -160px 0px 0px #84bba8, -170px 0px 0px #84bba8, -180px 0px 0px #84bba8, -190px 0px 0px #84bba8;
	}

	/*冰層陰影-底部*/
	.g1 {
		position: absolute;
		background: #72ccad;
		width: 100%;
		height: 20px;
		bottom: 0;
	}

	/*冰層陰影-仿像素畫效果*/
	.g2 {
		position: absolute;
		background: #72ccad;
		width: 50px;
		height: 140px;
		right: -30px;
		bottom: 0;
		box-shadow: -10px 50px 0px #72ccad, -20px 70px 0px #72ccad,
			-30px 80px 0px #72ccad, -40px 90px 0px #72ccad, -60px 100px 0px #72ccad,
			-110px 110px 0px #72ccad;
		/*用陰影仿出一格一格的效果*/
	}

	/*冰層透光處-仿像素畫效果*/
	.g3 {
		position: absolute;
		background: #c6feeb;
		width: 180px;
		height: 20px;
		top: 40px;
		box-shadow: -80px 10px 0px #c6feeb, -130px 20px 0px #c6feeb,
			-150px 30px 0px #c6feeb, -160px 40px 0px #c6feeb, -170px 50px 0px #c6feeb;
		/*用陰影仿出一格一格的效果*/
	}

	/*------------群山------------*/

	/*大山*/
	.mountain_a {
		position: absolute;
		background: #eeeeee;
		width: 780px;
		height: 660px;
		border-radius: 50%;
		bottom: -240px;
		left: 5%;
	}

	/*小山*/
	.mountain_b {
		position: absolute;
		background: #e5e5e5;
		width: 620px;
		height: 460px;
		border-radius: 50%;
		left: 25%;
		bottom: -80px;
	}

	/*------------房屋------------*/

	/*定位房子*/
	.house {
		position: absolute;
		bottom: 220px;
	}

	/*右邊一間*/
	.house.right {
		right: 10%;
	}

	/*左邊也一間*/
	.house.left {
		left: 12%;
	}

	/*牆壁的方形部分*/
	.wall {
		position: absolute;
		background: #e2f4f4;
		width: 80px;
		height: 40px;
	}

	/*牆壁的三角部分*/
	.wall:before {
		content: "";
		position: absolute;
		background: transparent;
		width: 0;
		height: 0;
		bottom: 40px;
		border-bottom: 80px solid #e2f4f4;
		border-left: 40px solid transparent;
		border-right: 40px solid transparent;
		/*就是一些三角形設定*/
	}

	/*屋頂設定*/
	.roof {
		position: absolute;
		background: #ffffff;
		width: 100px;
		height: 10px;
		border-radius: 40px;
	}

	/*右邊屋頂*/
	.roof.right {
		left: 14px;
		bottom: 30px;
		transform: rotate(58deg);
	}

	/*左邊屋頂*/
	.roof.left {
		left: -34px;
		bottom: 30px;
		transform: rotate(-58deg);
	}

	/*房子的門*/
	.door {
		position: absolute;
		background: #9acccb;
		width: 20px;
		height: 30px;
		bottom: -40px;
		left: 16px;
	}

	/*直柵欄*/
	.fence {
		position: absolute;
		background: #ffffff;
		width: 3px;
		height: 30px;
		bottom: -45px;
		left: -20px;
		border-radius: 3px;
		box-shadow: -10px 0px 0px #ffffff, -20px 0px 0px #ffffff,
			-30px 0px 0px #ffffff, -40px 0px 0px #ffffff, -50px 0px 0px #ffffff,
			-60px 0px 0px #ffffff, -70px 0px 0px #ffffff;
		/*用陰影做出其他的*/
	}

	/*橫柵欄*/
	.fence:before {
		content: "";
		position: absolute;
		background: #ffffff;
		width: 72px;
		height: 3px;
		bottom: 22px;
		right: 0;
		box-shadow: 0px 14px 0px #ffffff;
		/*用陰影做出其他的*/
	}

	/*------------植物------------*/

	/*小樹樹幹*/
	.tree_back {
		position: absolute;
		background: #348e8d;
		width: 10px;
		height: 15px;
		bottom: 180px;
		right: 30%;
	}

	/*小樹*/
	.tree_back:before {
		content: "";
		position: absolute;
		background: #e2f4f4;
		width: 30px;
		height: 60px;
		border-radius: 50%;
		bottom: 15px;
		right: -10px;
	}

	/*大樹樹幹*/
	.tree {
		position: absolute;
		background: #348e8d;
		width: 10px;
		height: 40px;
		bottom: 180px;
		right: 28%;
	}

	/*大樹*/
	.tree:before {
		content: "";
		position: absolute;
		background: #ffffff;
		width: 40px;
		height: 80px;
		border-radius: 50%;
		bottom: 25px;
		left: -15px;
	}

	/*------------郵筒------------*/

	/*郵筒a*/
	.postbox_a {
		position: absolute;
		background: #73fffd;
		width: 20px;
		height: 25px;
		bottom: 190px;
		left: 35%;
		animation-name: upppp;
		animation-duration: 1s;
		animation-iteration-count: infinite;
		/*無限重複播放動畫*/
		animation-timing-function: ease-in-out;
		/*緩入緩出效果*/
		animation-direction: alternate;
		/*反向播放動畫*/
	}

	/*郵筒a的桿子*/
	.postbox_a:after {
		content: "";
		position: absolute;
		background: #76ecea;
		width: 5px;
		height: 20px;
		bottom: -20px;
		left: 8px;
	}

	/*所有的郵筒洞洞*/
	.hole {
		position: absolute;
		background: #ffffff;
		width: 6px;
		height: 2px;
		top: 5px;
		left: 2px;
		box-shadow: 10px 0px 0px rgba(100%, 100%, 100%);
	}

	/*郵筒b*/
	.postbox_b {
		position: absolute;
		background: #2cb7b5;
		width: 20px;
		height: 25px;
		bottom: 190px;
		left: 37%;
		animation-name: upppp;
		animation-duration: 1s;
		animation-delay: 1s;
		/*晚一秒播放動畫*/
		animation-iteration-count: infinite;
		/*無限重複播放動畫*/
		animation-timing-function: ease-in-out;
		/*緩入緩出效果*/
		animation-direction: alternate;
		/*反向播放動畫*/
	}

	/*郵筒b的桿子*/
	.postbox_b:after {
		content: "";
		position: absolute;
		background: #348e8d;
		width: 5px;
		height: 20px;
		bottom: -20px;
		left: 8px;
	}

	/*郵筒上升動畫*/
	@keyframes upppp {
		100% {
			transform: translatey(-10px);
		}
	}

	/*------------雲朵------------*/

	/*雲的底部*/
	.cloud {
		position: relative;
		background: #ffffff;
		width: 100px;
		height: 40px;
		top: 50px;
		border-radius: 50px;
		z-index: -1;
	}

	/*雲的突起*/
	.cloud:after {
		content: "";
		position: absolute;
		background: #ffffff;
		width: 50px;
		height: 50px;
		border-radius: 50%;
		top: -20px;
		left: 10px;
	}

	/*雲的小突起*/
	.cloud:before {
		content: "";
		position: absolute;
		background: #ffffff;
		width: 40px;
		height: 40px;
		border-radius: 50%;
		top: -15px;
		right: 20px;
	}

	/*雲a的動畫設定*/
	.c1 {
		top: 60px;
		opacity: 0.5;
		animation-name: moving;
		animation-duration: 35s;
		animation-iteration-count: infinite;
		/*無限重複播放動畫*/
		animation-timing-function: ease-in-out;
		/*緩入緩出效果*/
	}

	/*雲b的動畫設定*/
	.c2 {
		top: 80px;
		opacity: 0.8;
		animation-name: moving;
		animation-duration: 25s;
		animation-iteration-count: infinite;
		/*無限重複播放動畫*/
		animation-timing-function: ease-in-out;
		/*緩入緩出效果*/
	}

	/*雲c的動畫設定*/
	.c3 {
		top: 100px;
		animation-name: moving;
		animation-duration: 18s;
		animation-iteration-count: infinite;
		/*無限重複播放動畫*/
		animation-timing-function: ease-in-out;
		/*緩入緩出效果*/
	}

	/*所有雲的位移動畫*/
	@keyframes moving {
		0% {
			margin-left: -200px;
		}

		100% {
			margin-left: 105%;
		}
	}

	/*------------風車------------*/

	/*定位風車*/
	.windmill {
		position: absolute;
		left: 50%;
		bottom: 180px;
	}

	/*風車塔*/
	.tower {
		position: absolute;
		background: transparent;
		width: 60px;
		height: 0;
		border-top: 0px solid transparent;
		border-bottom: 90px solid #e2f4f4;
		border-right: 20px solid transparent;
		border-left: 20px solid transparent;
		bottom: 0;
	}

	/*風車中間*/
	.t1 {
		position: absolute;
		background: #2cb7b5;
		width: 90px;
		height: 10px;
		bottom: 40px;
		left: 5px;
	}

	/*塔門*/
	.t1:before {
		content: "";
		position: absolute;
		background: #2cb7b5;
		width: 20px;
		height: 20px;
		bottom: -40px;
		right: 35px;
		box-shadow: 0px -54px 0px #2cb7b5;
		/*二樓的窗*/
	}

	/*風車屋頂*/
	.t2 {
		position: absolute;
		background: transparent;
		width: 0;
		height: 0;
		border-bottom: 40px solid #2cb7b5;
		border-right: 30px solid transparent;
		border-left: 30px solid transparent;
		bottom: 90px;
		left: 20px;
	}

	/*風車屋簷*/
	.t2:after {
		content: "";
		position: absolute;
		background: #2cb7b5;
		width: 70px;
		height: 10px;
		border-radius: 10px;
		bottom: -50px;
		left: -35px;
	}

	/*扇葉範圍與動畫*/
	.blade {
		position: absolute;
		width: 100px;
		height: 200px;
		left: 0;
		bottom: 0;
		animation-name: spin;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		/*無限重複播放動畫*/
		animation-timing-function: linear;
		/*線性動畫*/
	}

	/*扇葉柄*/
	.windblade {
		position: absolute;
		background: #ffffff;
		width: 4px;
		height: 76px;
		bottom: 106px;
		left: 46px;
	}

	/*扇葉*/
	.windblade:before {
		content: "";
		position: absolute;
		background: #e2f4f4;
		opacity: 0.8;
		width: 16px;
		height: 60px;
	}

	/*複製一個旋轉90度*/
	.windblade2 {
		transform: rotate(90deg);
		bottom: 65px;
		left: 87px;
	}

	/*複製一個旋轉180度*/
	.windblade3 {
		transform: rotate(180deg);
		bottom: 25px;
	}

	/*複製一個旋轉270度*/
	.windblade4 {
		transform: rotate(270deg);
		bottom: 65px;
		left: 5px;
	}

	/*旋轉中心點*/
	.windblade4:after {
		content: "";
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		bottom: -8px;
		right: -3px;
	}

	/*風車旋轉動畫*/
	@keyframes spin {
		100% {
			transform: rotate(360deg);
		}
	}

	/*------------落雪------------*/

	/*落雪範圍*/
	.allsnows {
		position: absolute;
		width: 100%;
		height: 100%;
		left: 0;
		top: 0;
	}

	/*落下動畫*/
	@keyframes snowing {
		0% {
			opacity: 0;
		}

		70% {
			opacity: 1;
		}

		100% {
			transform: translatey(600px);
		}
	}

	/*個別設定雪球*/
	.allsnows .snow1 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		left: 5%;
		top: -2%;
	}

	.allsnows .snow2 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 3s;
		/*晚一秒播放動畫*/
		left: 10%;
		top: -2%;
	}

	.allsnows .snow3 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 7s;
		/*晚一秒播放動畫*/
		left: 15%;
		top: -2%;
	}

	.allsnows .snow4 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 2s;
		/*晚一秒播放動畫*/
		left: 20%;
		top: -2%;
	}

	.allsnows .snow5 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 5s;
		/*晚播放動畫*/
		left: 25%;
		top: -2%;
	}

	.allsnows .snow6 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 3s;
		/*晚播放動畫*/
		left: 30%;
		top: -2%;
	}

	.allsnows .snow7 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 7s;
		/*晚播放動畫*/
		left: 35%;
		top: -2%;
	}

	.allsnows .snow8 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 4s;
		/*晚播放動畫*/
		left: 40%;
		top: -2%;
	}

	.allsnows .snow9 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 1s;
		/*晚播放動畫*/
		left: 45%;
		top: -2%;
	}

	.allsnows .snow10 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 6s;
		/*晚播放動畫*/
		left: 50%;
		top: -2%;
	}

	.allsnows .snow11 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 5s;
		/*晚播放動畫*/
		left: 55%;
		top: -2%;
	}

	.allsnows .snow12 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 7s;
		/*晚播放動畫*/
		left: 60%;
		top: -2%;
	}

	.allsnows .snow13 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 4s;
		/*晚播放動畫*/
		left: 65%;
		top: -2%;
	}

	.allsnows .snow14 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 6s;
		/*晚播放動畫*/
		left: 70%;
		top: -2%;
	}

	.allsnows .snow15 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 4s;
		/*晚播放動畫*/
		left: 75%;
		top: -2%;
	}

	.allsnows .snow16 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 3s;
		/*晚播放動畫*/
		left: 80%;
		top: -2%;
	}

	.allsnows .snow17 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 6s;
		/*晚播放動畫*/
		left: 85%;
		top: -2%;
	}

	.allsnows .snow18 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 2s;
		/*晚播放動畫*/
		left: 90%;
		top: -2%;
	}

	.allsnows .snow19 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 10s;
		animation-iteration-count: infinite;
		animation-delay: 3s;
		/*晚播放動畫*/
		left: 95%;
		top: -2%;
	}

	.allsnows .snow20 {
		position: absolute;
		background: #ffffff;
		width: 10px;
		height: 10px;
		border-radius: 50%;
		animation-name: snowing;
		animation-duration: 8s;
		animation-iteration-count: infinite;
		animation-delay: 8s;
		/*晚播放動畫*/
		left: 45%;
		top: -2%;
	}

	/*Created by 87penginnouta APRIL 20, 2019*/
</style>