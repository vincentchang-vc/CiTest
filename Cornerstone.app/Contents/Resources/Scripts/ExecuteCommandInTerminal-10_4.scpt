FasdUAS 1.101.10   ��   ��    k             l      ��  ��   :4
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
 * $HeadURL: file:///Users/simonw/Dev/Repos/Zenna/lib/CocoaExtensions/trunk/Scripts/ExecuteCommandInTerminal-10_4.applescript $
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
      � 	 	h 
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
   *   $ H e a d U R L :   f i l e : / / / U s e r s / s i m o n w / D e v / R e p o s / Z e n n a / l i b / C o c o a E x t e n s i o n s / t r u n k / S c r i p t s / E x e c u t e C o m m a n d I n T e r m i n a l - 1 0 _ 4 . a p p l e s c r i p t   $ 
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
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k     7       O        r        l    ����  I   �� ��
�� .coredoexbool       obj   4    �� 
�� 
prcs  m       �    T e r m i n a l��  ��  ��    o      ���� 0 
terminalon 
terminalOn  m       �                                                                                  sevs  alis    �  Macintosh HD               �9�cH+   +�nSystem Events.app                                               -��8CW        ����  	                CoreServices    �9�S      �8'7     +�n +�+ +�*  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��        l   ��������  ��  ��      ��   O    7 ! " ! k    6 # #  $ % $ Z    0 & '�� ( & l    )���� ) o    ���� 0 
terminalon 
terminalOn��  ��   ' I    �� *��
�� .coredoscnull��� ��� ctxt * n     + , + 4    �� -
�� 
cobj - m    ����  , o    ���� 0 argv  ��  ��   ( I  # 0�� . /
�� .coredoscnull��� ��� ctxt . n   # ' 0 1 0 4   $ '�� 2
�� 
cobj 2 m   % &����  1 o   # $���� 0 argv   / �� 3��
�� 
kfil 3 4  ( ,�� 4
�� 
cwin 4 m   * +���� ��   %  5�� 5 I  1 6������
�� .miscactvnull��� ��� null��  ��  ��   " m     6 6�                                                                                      @ alis    j  Macintosh HD               �9�cH+   +�wTerminal.app                                                    ,M=�wc�        ����  	                	Utilities     �9�S      �wG�     +�w +�v  0Macintosh HD:Applications:Utilities:Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  ��     7�� 7 l     ��������  ��  ��  ��       �� 8 9��   8 ��
�� .aevtoappnull  �   � **** 9 �� ���� : ;��
�� .aevtoappnull  �   � ****�� 0 argv  ��   : ���� 0 argv   ;  �� ���� 6����������
�� 
prcs
�� .coredoexbool       obj �� 0 
terminalon 
terminalOn
�� 
cobj
�� .coredoscnull��� ��� ctxt
�� 
kfil
�� 
cwin
�� .miscactvnull��� ��� null�� 8� *��/j E�UO� $� ��k/j Y ��k/�*�k/l O*j 
Uascr  ��ޭ