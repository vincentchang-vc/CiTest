FasdUAS 1.101.10   ��   ��    k             l      ��  ��   5/
 * ============================================================================
 * 
 * Copyright (c) Zennaware GmbH, 2007
 * All Rights Reserved.
 * 
 * ============================================================================
 * 
 * This software is provided "as is," without warranty of any kind, express or 
 * implied. In no event shall the author or contributors be held liable for any 
 * damages arising in any way from the use of this software.
 * 
 * ============================================================================
 * 
 * $HeadURL: file:///Users/simonw/Dev/Repos/Zenna/lib/CocoaExtensions/trunk/Scripts/ExecuteCommandInTerminal.applescript $
 * 
 * ============================================================================
 * 
 * Created          : 21/12/2007
 * Created By       : Simon Wilson
 * Last Modified    : $Date: 2008-03-12 01:50:53 +0100 (Wed, 12 Mar 2008) $
 * Last Modified By : $Author: simonwilson $
 * Version          : $Revision: 2455 $
 *  
 * ============================================================================
      � 	 	^ 
   *   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
   *   
   *   C o p y r i g h t   ( c )   Z e n n a w a r e   G m b H ,   2 0 0 7 
   *   A l l   R i g h t s   R e s e r v e d . 
   *   
   *   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
   *   
   *   T h i s   s o f t w a r e   i s   p r o v i d e d   " a s   i s , "   w i t h o u t   w a r r a n t y   o f   a n y   k i n d ,   e x p r e s s   o r   
   *   i m p l i e d .   I n   n o   e v e n t   s h a l l   t h e   a u t h o r   o r   c o n t r i b u t o r s   b e   h e l d   l i a b l e   f o r   a n y   
   *   d a m a g e s   a r i s i n g   i n   a n y   w a y   f r o m   t h e   u s e   o f   t h i s   s o f t w a r e . 
   *   
   *   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
   *   
   *   $ H e a d U R L :   f i l e : / / / U s e r s / s i m o n w / D e v / R e p o s / Z e n n a / l i b / C o c o a E x t e n s i o n s / t r u n k / S c r i p t s / E x e c u t e C o m m a n d I n T e r m i n a l . a p p l e s c r i p t   $ 
   *   
   *   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
   *   
   *   C r e a t e d                     :   2 1 / 1 2 / 2 0 0 7 
   *   C r e a t e d   B y               :   S i m o n   W i l s o n 
   *   L a s t   M o d i f i e d         :   $ D a t e :   2 0 0 8 - 0 3 - 1 2   0 1 : 5 0 : 5 3   + 0 1 0 0   ( W e d ,   1 2   M a r   2 0 0 8 )   $ 
   *   L a s t   M o d i f i e d   B y   :   $ A u t h o r :   s i m o n w i l s o n   $ 
   *   V e r s i o n                     :   $ R e v i s i o n :   2 4 5 5   $ 
   *     
   *   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
     
  
 l     ��������  ��  ��        i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    O     �    k    �       r        m    ����    o      ���� &0 terminalisrunning terminalIsRunning      l   ��������  ��  ��        O        r        l     ����   I   �� !��
�� .corecnte****       **** ! l    "���� " 6    # $ # 2    ��
�� 
prcs $ =    % & % 1    ��
�� 
pnam & m     ' ' � ( (  T e r m i n a l��  ��  ��  ��  ��    o      ���� &0 terminalisrunning terminalIsRunning  m    	 ) )�                                                                                  sevs  alis    �  Macintosh HD               ��t�H+    pSystem Events.app                                               +��8CW        ����  	                CoreServices    ��X�      �8'7      p  -  ,  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��     * + * l     ��������  ��  ��   +  , - , Z     � . / 0 1 . =    # 2 3 2 o     !���� &0 terminalisrunning terminalIsRunning 3 m   ! "����   / Q   & S 4 5 6 4 k   ) A 7 7  8 9 8 I  ) 8���� :
�� .coredoscnull��� ��� ctxt��   : �� ; <
�� 
cmnd ; n   + / = > = 4   , /�� ?
�� 
cobj ? m   - .����  > o   + ,���� 0 argv   < �� @��
�� 
kfil @ 4   0 4�� A
�� 
cwin A m   2 3���� ��   9  B�� B r   9 A C D C m   9 :��
�� boovtrue D n       E F E 1   > @��
�� 
pisf F 4   : >�� G
�� 
cwin G m   < =���� ��   5 R      �� H I
�� .ascrerr ****      � **** H o      ���� 0 errtext errText I �� J��
�� 
errn J o      ���� 0 errnum errNum��   6 I  I S���� K
�� .coredoscnull��� ��� ctxt��   K �� L��
�� 
cmnd L n   K O M N M 4   L O�� O
�� 
cobj O m   M N����  N o   K L���� 0 argv  ��   0  P Q P =  V _ R S R l  V ] T���� T I  V ]�� U��
�� .corecnte****       **** U 2  V Y��
�� 
cwin��  ��  ��   S m   ] ^����   Q  V�� V I  b l���� W
�� .coredoscnull��� ��� ctxt��   W �� X��
�� 
cmnd X n   d h Y Z Y 4   e h�� [
�� 
cobj [ m   f g����  Z o   d e���� 0 argv  ��  ��   1 k   o � \ \  ] ^ ] O  o y _ ` _ I  s x������
�� .miscactvnull��� ��� null��  ��   ` m   o p a a�                                                                                      @ alis    j  Macintosh HD               ��t�H+    yTerminal.app                                                     Y?�wc�        ����  	                	Utilities     ��X�      �wG�      y  x  0Macintosh HD:Applications:Utilities:Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��   ^  b c b O  z � d e d O  ~ � f g f I  � ��� h i
�� .prcskprsnull���    utxt h m   � � j j � k k  t i �� l��
�� 
faal l m   � ���
�� eMdsKcmd��   g 4   ~ ��� m
�� 
prcs m m   � � n n � o o  T e r m i n a l e m   z { p p�                                                                                  sevs  alis    �  Macintosh HD               ��t�H+    pSystem Events.app                                               +��8CW        ����  	                CoreServices    ��X�      �8'7      p  -  ,  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   c  q r q I  � ��� s��
�� .sysodelanull��� ��� nmbr s m   � � t t ?�      ��   r  u�� u I  � ����� v
�� .coredoscnull��� ��� ctxt��   v �� w x
�� 
cmnd w n   � � y z y 4   � ��� {
�� 
cobj { m   � �����  z o   � ����� 0 argv   x �� |��
�� 
kfil | 4   � ��� }
�� 
cwin } m   � ����� ��  ��   -  ~  ~ l  � ���������  ��  ��     ��� � I  � �������
�� .miscactvnull��� ��� null��  ��  ��    m      � ��                                                                                      @ alis    j  Macintosh HD               ��t�H+    yTerminal.app                                                     Y?�wc�        ����  	                	Utilities     ��X�      �wG�      y  x  0Macintosh HD:Applications:Utilities:Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��     ��� � l     ��������  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ���� � ���
�� .aevtoappnull  �   � ****�� 0 argv  ��   � �������� 0 argv  �� 0 errtext errText�� 0 errnum errNum �  ��� )�� ��� '������������������ ��� n j������ t���� &0 terminalisrunning terminalIsRunning
�� 
prcs �  
�� 
pnam
�� .corecnte****       ****
�� 
cmnd
�� 
cobj
�� 
kfil
�� 
cwin�� 
�� .coredoscnull��� ��� ctxt
�� 
pisf�� 0 errtext errText � �����
�� 
errn�� 0 errnum errNum�  
�� .miscactvnull��� ��� null
�� 
faal
�� eMdsKcmd
�� .prcskprsnull���    utxt
�� .sysodelanull��� ��� nmbr�� �� �jE�O� *�-�[�,\Z�81j E�UO�j  2 *��k/�*�k/� Oe*�k/�,FW X  *��k/l Y Z*�-j j  *��k/l Y A� *j UO� *�a / a a a l UUOa j O*��k/�*�k/� O*j Uascr  ��ޭ