<svg width="1050" height="400.00000000000006" xmlns="http://www.w3.org/2000/svg">
 <!-- Created with Method Draw - http://github.com/duopixel/Method-Draw/ -->

 <g>
  <title>background</title>
  <rect x="-1" y="-1" width="1052" height="402" id="canvas_background" fill="#ffffff"/>
  <g id="canvasGrid" display="none">
   <rect id="svg_2" width="100%" height="100%" x="0" y="0" stroke-width="0" fill="url(#gridpattern)"/>
  </g>
 </g>
 <g>
  <title>Layer 1</title>
  <rect stroke="null" fill="#ffffff" stroke-width="1.5" x="69.000007" y="64.755478" width="244.999993" height="54" id="svg_29" ng-click="updateMatchScore(rounds[0].matchlist[0])"/>
  <text fill="#000000" stroke-width="0" x="164.478694" y="96.425954" id="svg_31" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[0].score}}</text>
 <!-- 1 Match -->
  <rect ng-if="rounds[0].matchlist[0].status == 'COMPLETED' && rounds[0].matchlist[0].winnerId == rounds[0].matchlist[0].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="64.755478" width="223" height="21" id="svg_1" rx="5"/>
  <rect ng-if="rounds[0].matchlist[0].status == 'COMPLETED' && rounds[0].matchlist[0].winnerId != rounds[0].matchlist[0].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="64.755478" width="223" height="21" id="svg_1" rx="5"/>
  <rect ng-if="rounds[0].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="64.755478" width="223" height="21" id="svg_1" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="64.755478" x2="93.5" y2="86.317978" id="svg_4" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="80.755478" id="svg_9" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[0].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="54" id="svg_10" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[0].playerName1}}</text>
 
  <rect ng-if="rounds[0].matchlist[0].byMatch" fill="#E2E3E2" stroke="#000" stroke-width="1.5" x="68.5" y="98.755478" width="223" height="21" id="svg_14" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[0].byMatch && rounds[0].matchlist[0].status == 'COMPLETED' && rounds[0].matchlist[0].winnerId == rounds[0].matchlist[0].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="98.755478" width="223" height="21" id="svg_14" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[0].byMatch && rounds[0].matchlist[0].status == 'COMPLETED' && rounds[0].matchlist[0].winnerId != rounds[0].matchlist[0].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="98.755478" width="223" height="21" id="svg_14" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[0].byMatch && rounds[0].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="98.755478" width="223" height="21" id="svg_14" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="98.755478" x2="93.5" y2="120.317978" id="svg_15" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="114.755478" id="svg_16" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[0].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="88" id="svg_17" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[0].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="76" x2="303" y2="76" id="svg_25" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="110" x2="303" y2="110" id="svg_26" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="302.5" y1="76.4375" x2="302.5" y2="111" id="svg_27" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="303" y1="94" x2="314" y2="94" id="svg_28" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <rect stroke="null" fill="#ffffff" stroke-width="1.5" x="69.000007" y="132.755478" width="244.999993" height="54" id="svg_24" ng-click="updateMatchScore(rounds[0].matchlist[1])"/>
  <text fill="#000000" stroke-width="0" x="164.478694" y="164.425954" id="svg_30" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[1].score}}</text>
 <!-- 2 Match -->
  <rect ng-if="rounds[0].matchlist[1].status == 'COMPLETED' && rounds[0].matchlist[1].winnerId == rounds[0].matchlist[1].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="132.755478" width="223" height="21" id="svg_32" rx="5"/>
  <rect ng-if="rounds[0].matchlist[1].status == 'COMPLETED' && rounds[0].matchlist[1].winnerId != rounds[0].matchlist[1].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="132.755478" width="223" height="21" id="svg_32" rx="5"/>
  <rect ng-if="rounds[0].matchlist[1].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="132.755478" width="223" height="21" id="svg_32" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="132.755478" x2="93.5" y2="154.317978" id="svg_33" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="148.755478" id="svg_34" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[1].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="122" id="svg_35" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[1].playerName1}}</text>
 
  <rect ng-if="rounds[0].matchlist[1].byMatch" fill="#E2E3E2" stroke="#000" stroke-width="1.5" x="68.5" y="166.755478" width="223" height="21" id="svg_36" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[1].byMatch && rounds[0].matchlist[1].status == 'COMPLETED'  && rounds[0].matchlist[1].winnerId == rounds[0].matchlist[1].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="166.755478" width="223" height="21" id="svg_36" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[1].byMatch && rounds[0].matchlist[1].status == 'COMPLETED'  && rounds[0].matchlist[1].winnerId != rounds[0].matchlist[1].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="166.755478" width="223" height="21" id="svg_36" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[1].byMatch && rounds[0].matchlist[1].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="166.755478" width="223" height="21" id="svg_36" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="166.755478" x2="93.5" y2="188.317978" id="svg_37" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="182.755478" id="svg_38" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[1].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="156" id="svg_39" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[1].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="144" x2="303" y2="144" id="svg_40" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="178" x2="303" y2="178" id="svg_41" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="302.5" y1="144.4375" x2="302.5" y2="179" id="svg_42" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="303" y1="162" x2="314" y2="162" id="svg_43" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <rect stroke="null" fill="#ffffff" stroke-width="1.5" x="69.000007" y="201.755478" width="244.999993" height="54" id="svg_51" ng-click="updateMatchScore(rounds[0].matchlist[2])"/>
  <text fill="#000000" stroke-width="0" x="164.478694" y="233.425954" id="svg_52" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[2].score}}</text>
  <!-- 3 Match -->
  <rect ng-if="rounds[0].matchlist[2].status == 'COMPLETED' && rounds[0].matchlist[2].winnerId == rounds[0].matchlist[2].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="201.755478" width="223" height="21" id="svg_53" rx="5"/>
  <rect ng-if="rounds[0].matchlist[2].status == 'COMPLETED' && rounds[0].matchlist[2].winnerId != rounds[0].matchlist[2].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="201.755478" width="223" height="21" id="svg_53" rx="5"/>
  <rect ng-if="rounds[0].matchlist[2].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="201.755478" width="223" height="21" id="svg_53" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="201.755478" x2="93.5" y2="223.317978" id="svg_54" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="217.755478" id="svg_55" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[2].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="191" id="svg_56" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[2].playerName1}}</text>
  
  <rect ng-if="rounds[0].matchlist[2].byMatch" fill="#E2E3E2" stroke="#000" stroke-width="1.5" x="68.5" y="235.755478" width="223" height="21" id="svg_57" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[2].byMatch && rounds[0].matchlist[2].status == 'COMPLETED' && rounds[0].matchlist[2].winnerId == rounds[0].matchlist[2].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="235.755478" width="223" height="21" id="svg_57" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[2].byMatch && rounds[0].matchlist[2].status == 'COMPLETED' && rounds[0].matchlist[2].winnerId != rounds[0].matchlist[2].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="235.755478" width="223" height="21" id="svg_57" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[2].byMatch && rounds[0].matchlist[2].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="235.755478" width="223" height="21" id="svg_57" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="235.755478" x2="93.5" y2="257.317978" id="svg_58" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="251.755478" id="svg_59" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[2].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="225" id="svg_60" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[2].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="213" x2="303" y2="213" id="svg_61" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="247" x2="303" y2="247" id="svg_62" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="302.5" y1="213.4375" x2="302.5" y2="248" id="svg_63" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="303" y1="231" x2="314" y2="231" id="svg_64" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <rect stroke="null" fill="#ffffff" stroke-width="1.5" x="69.000007" y="271.755478" width="244.999993" height="54" id="svg_65" ng-click="updateMatchScore(rounds[0].matchlist[3])"/>
  <text fill="#000000" stroke-width="0" x="164.478694" y="303.425954" id="svg_66" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[3].score}}</text>
 <!-- 4 Match -->
  <rect ng-if="rounds[0].matchlist[3].byMatch" fill="#E2E3E2" stroke="#000" stroke-width="1.5" x="68.5" y="271.755478" width="223" height="21" id="svg_67" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[3].byMatch && rounds[0].matchlist[3].status == 'COMPLETED' && rounds[0].matchlist[3].winnerId == rounds[0].matchlist[3].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="271.755478" width="223" height="21" id="svg_67" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[3].byMatch && rounds[0].matchlist[3].status == 'COMPLETED' && rounds[0].matchlist[3].winnerId != rounds[0].matchlist[3].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="271.755478" width="223" height="21" id="svg_67" rx="5"/>
  <rect ng-if="!rounds[0].matchlist[3].byMatch && rounds[0].matchlist[3].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="271.755478" width="223" height="21" id="svg_67" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="271.755478" x2="93.5" y2="293.317978" id="svg_68" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="287.755478" id="svg_69" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[3].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="261" id="svg_70" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[3].playerName1}}</text>
  
  <rect ng-if="rounds[0].matchlist[3].status == 'COMPLETED' && rounds[0].matchlist[3].winnerId == rounds[0].matchlist[3].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="68.5" y="305.755478" width="223" height="21" id="svg_71" rx="5"/>
  <rect ng-if="rounds[0].matchlist[3].status == 'COMPLETED' && rounds[0].matchlist[3].winnerId != rounds[0].matchlist[3].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="305.755478" width="223" height="21" id="svg_71" rx="5"/>
  <rect ng-if="rounds[0].matchlist[3].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="68.5" y="305.755478" width="223" height="21" id="svg_71" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="93.5" y1="305.755478" x2="93.5" y2="327.317978" id="svg_72" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="73.5" y="321.755478" id="svg_73" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[0].matchlist[3].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="94.976172" y="295" id="svg_74" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[0].matchlist[3].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="283" x2="303" y2="283" id="svg_75" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="292" y1="317" x2="303" y2="317" id="svg_76" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="302.5" y1="283.4375" x2="302.5" y2="318" id="svg_77" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="303" y1="301" x2="314" y2="301" id="svg_78" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <rect fill="#ffffff" stroke-width="1.5" x="315.000007" y="83.755478" width="244.999993" height="86.999996" id="svg_79" stroke="null" ng-click="updateMatchScore(rounds[1].matchlist[0])"/>
  <text fill="#000000" stroke-width="0" x="410.478694" y="133.425954" id="svg_80" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[1].matchlist[0].score}}</text>
  <!-- 5 Match -->
  <rect ng-if="rounds[1].matchlist[0].status == 'COMPLETED' && rounds[1].matchlist[0].winnerId == rounds[1].matchlist[0].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="314.5" y="83.755478" width="223" height="21" id="svg_81" rx="5"/>
  <rect ng-if="rounds[1].matchlist[0].status == 'COMPLETED' && rounds[1].matchlist[0].winnerId != rounds[1].matchlist[0].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="83.755478" width="223" height="21" id="svg_81" rx="5"/>
  <rect ng-if="rounds[1].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="83.755478" width="223" height="21" id="svg_81" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="339.5" y1="83.755478" x2="339.5" y2="105.317978" id="svg_82" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="319.5" y="99.755478" id="svg_83" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[1].matchlist[0].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="312.530172" y="73" id="svg_84" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[1].matchlist[0].playerName1}}</text>
  
  <rect ng-if="rounds[1].matchlist[0].status == 'COMPLETED' && rounds[1].matchlist[0].winnerId == rounds[1].matchlist[0].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="314.5" y="151.755478" width="223" height="21" id="svg_85" rx="5"/>
  <rect ng-if="rounds[1].matchlist[0].status == 'COMPLETED' && rounds[1].matchlist[0].winnerId != rounds[1].matchlist[0].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="151.755478" width="223" height="21" id="svg_85" rx="5"/>
  <rect ng-if="rounds[1].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="151.755478" width="223" height="21" id="svg_85" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="339.5" y1="151.755478" x2="339.5" y2="173.317978" id="svg_86" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="318.5" y="167.755478" id="svg_87" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[1].matchlist[0].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="347.693001" y="167" id="svg_88" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" stroke="#000">{{rounds[1].matchlist[0].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="538" y1="95" x2="549" y2="95" id="svg_89" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="538" y1="163" x2="549" y2="163" id="svg_90" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="548.5" y1="95" x2="549" y2="163" id="svg_91" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="549" y1="131" x2="560" y2="131" id="svg_92" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <rect fill="#ffffff" stroke-width="1.5" x="315.000007" y="221.755478" width="244.999993" height="86.999996" id="svg_98" stroke="null" ng-click="updateMatchScore(rounds[1].matchlist[1])"/>
  <text fill="#000000" stroke-width="0" x="410.478694" y="271.425954" id="svg_99" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[1].matchlist[1].score}}</text>
 <!-- 6 Match -->
  <rect ng-if="rounds[1].matchlist[1].status == 'COMPLETED' && rounds[1].matchlist[1].winnerId == rounds[1].matchlist[1].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="314.5" y="221.755478" width="223" height="21" id="svg_100" rx="5"/>
  <rect ng-if="rounds[1].matchlist[1].status == 'COMPLETED' && rounds[1].matchlist[1].winnerId != rounds[1].matchlist[1].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="221.755478" width="223" height="21" id="svg_100" rx="5"/>
  <rect ng-if="rounds[1].matchlist[1].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="221.755478" width="223" height="21" id="svg_100" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="339.5" y1="221.755478" x2="339.5" y2="243.317978" id="svg_101" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="319.5" y="237.755478" id="svg_102" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[1].matchlist[1].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="312.530172" y="211" id="svg_103" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[1].matchlist[1].playerName1}}</text>
 
  <rect ng-if="rounds[1].matchlist[1].status == 'COMPLETED' && rounds[1].matchlist[1].winnerId == rounds[1].matchlist[1].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="314.5" y="289.755478" width="223" height="21" id="svg_104" rx="5"/>
  <rect ng-if="rounds[1].matchlist[1].status == 'COMPLETED' && rounds[1].matchlist[1].winnerId != rounds[1].matchlist[1].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="289.755478" width="223" height="21" id="svg_104" rx="5"/>
  <rect ng-if="rounds[1].matchlist[1].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="314.5" y="289.755478" width="223" height="21" id="svg_104" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="339.5" y1="289.755478" x2="339.5" y2="311.317978" id="svg_105" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="318.5" y="305.755478" id="svg_106" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[1].matchlist[1].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="347.693001" y="305" id="svg_107" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" stroke="#000">{{rounds[1].matchlist[1].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="538" y1="233" x2="549" y2="233" id="svg_108" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="538" y1="301" x2="549" y2="301" id="svg_109" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="548.5" y1="233" x2="548.5" y2="301" id="svg_110" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="549" y1="269" x2="560" y2="269" id="svg_111" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <rect fill="#ffffff" stroke-width="1.5" x="563.000007" y="119.755478" width="244.999993" height="158.999984" id="svg_112" stroke="null" ng-click="updateMatchScore(rounds[2].matchlist[0])"/>
  <text fill="#000000" stroke-width="0" x="657.478694" y="202.425954" id="svg_113" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[2].matchlist[0].score}}</text>
  <!-- 7 Match -->
  <rect ng-if="rounds[2].matchlist[0].status == 'COMPLETED' && rounds[2].matchlist[0].winnerId == rounds[2].matchlist[0].playerId1" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="561.5" y="119.755478" width="223" height="21" id="svg_114" rx="5"/>
  <rect ng-if="rounds[2].matchlist[0].status == 'COMPLETED' && rounds[2].matchlist[0].winnerId != rounds[2].matchlist[0].playerId1" fill="#ffffff" stroke="#000" stroke-width="1.5" x="561.5" y="119.755478" width="223" height="21" id="svg_114" rx="5"/>
  <rect ng-if="rounds[2].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="561.5" y="119.755478" width="223" height="21" id="svg_114" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="586.5" y1="119.755478" x2="586.5" y2="141.317978" id="svg_115" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="566.5" y="135.755478" id="svg_116" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[2].matchlist[0].seeding1}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="530.968538" y="109" id="svg_117" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="matrix(1.1307537426431151,0,0,1,-8.555078217032968,25.317977905273438) " stroke="#000">{{rounds[2].matchlist[0].playerName1}}</text>
 
  <rect ng-if="rounds[2].matchlist[0].status == 'COMPLETED' && rounds[2].matchlist[0].winnerId == rounds[2].matchlist[0].playerId2" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="561.5" y="257.755478" width="223" height="21" id="svg_118" rx="5"/>
  <rect ng-if="rounds[2].matchlist[0].status == 'COMPLETED' && rounds[2].matchlist[0].winnerId != rounds[2].matchlist[0].playerId2" fill="#ffffff" stroke="#000" stroke-width="1.5" x="561.5" y="257.755478" width="223" height="21" id="svg_118" rx="5"/>
  <rect ng-if="rounds[2].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="561.5" y="257.755478" width="223" height="21" id="svg_118" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="586.5" y1="256.755478" x2="586.5" y2="278.317978" id="svg_119" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="565.5" y="272.755478" id="svg_120" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[2].matchlist[0].seeding2}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="594.693001" y="271" id="svg_121" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" stroke="#000">{{rounds[2].matchlist[0].playerName2}}</text>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="785" y1="131" x2="796" y2="131" id="svg_122" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="785" y1="268" x2="796" y2="268" id="svg_123" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <line fill="none" stroke="#000" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="796" y1="131" x2="795.5" y2="268" id="svg_124" stroke-linejoin="null" stroke-linecap="null"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="796" y1="201" x2="807" y2="201" id="svg_125" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  
  <rect ng-if="rounds[2].matchlist[0].status == 'COMPLETED'" fill="#b3ffd9" stroke="#000" stroke-width="1.5" x="808.5" y="190.755478" width="223" height="21" id="svg_127" rx="5"/>
  <rect ng-if="rounds[2].matchlist[0].status != 'COMPLETED'" fill="#ffffff" stroke="#000" stroke-width="1.5" x="808.5" y="190.755478" width="223" height="21" id="svg_127" rx="5"/>
  <line fill="none" stroke-width="1.5" stroke-opacity="null" fill-opacity="null" x1="833.5" y1="189.755478" x2="833.5" y2="211.317978" id="svg_128" stroke-linejoin="null" stroke-linecap="null" stroke="#000"/>
  <text fill="#000000" stroke="#000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="812.5" y="205.755478" id="svg_129" font-size="14" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">{{rounds[2].matchlist[0].winnerSeed}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="841.693001" y="204" id="svg_130" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" stroke="#000">{{rounds[2].matchlist[0].winner}}</text>
  <text fill="#000000" stroke-width="0" stroke-opacity="null" fill-opacity="null" x="5.5" y="35.4375" id="svg_131" font-size="11" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" stroke="#000"/>
  <text style="cursor: move;" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_3" y="79.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[0].aitaRank1}}</text>
  <text style="cursor: move;" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_5" y="113.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[0].aitaRank2}}</text>
  <text style="cursor: move;" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_6" y="146.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[1].aitaRank1}}</text>
  <text stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_7" y="181.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[1].aitaRank2}}</text>
  <text style="cursor: move;" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_8" y="216.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[2].aitaRank1}}</text>
  <text style="cursor: move;" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_11" y="250.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[2].aitaRank2}}</text>
  <text style="cursor: move;" stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_12" y="286.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[3].aitaRank1}}</text>
  <text stroke="#000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="12" id="svg_13" y="319.4375" x="17" stroke-width="0" fill="#000000">{{rounds[0].matchlist[3].aitaRank2}}</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="13" id="svg_18" y="34.4375" x="153" stroke-width="0" stroke="#000" fill="#000000">ROUND 1</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="13" id="svg_19" y="34.4375" x="405" stroke-width="0" stroke="#000" fill="#000000">SEMI</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="13" id="svg_20" y="35.4375" x="643" stroke-width="0" stroke="#000" fill="#000000">FINAL</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="13" id="svg_21" y="35.4375" x="900" stroke-width="0" stroke="#000" fill="#000000">WINNER</text>
 </g>
</svg>