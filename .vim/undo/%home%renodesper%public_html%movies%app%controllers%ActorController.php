Vim�UnDo� ��8F���W�~	�V�5��g�`�7��Bv      ?                                            'description'   =>       ?      I       I   I   I    SR��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             SR�$     �                   5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR�)     �                  <?php5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR�+     �                 ?>5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             SR�-     �                 ?>5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             SR�.     �                5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                             SR�C     �               3    class ActorController extends BaseController {}5�_�                       1    ����                                                                                                                                                                                                                                                                                                                                                             SR�D     �               2    class ActorController extends BaseController{}5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             SR�F    �                   }5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             SR�~     �                   5�_�   	              
      0    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               0        public function getActorInfo($actorname)5�_�   
                    1    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               2        public function getActorInfo($actorname){}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               	        }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �                       5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               )            $actor = Actor::where('name')5�_�                       0    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               1            $actor = Actor::where('name', 'like')5�_�                       5    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               6            $actor = Actor::where('name', 'like', '%')5�_�                       E    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               E            $actor = Actor::where('name', 'like', '%'.$actorname.'%')5�_�                       N    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               N            $actor = Actor::where('name', 'like', '%'.$actorname.'%')->first()5�_�                       O    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               O            $actor = Actor::where('name', 'like', '%'.$actorname.'%')->first();5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �         	                  if ()�                           5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �         	                  if ($actor)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �         	                  if ($actor) {}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �      	   
                  }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �                           5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               +                $actorInfo = array('error')5�_�                       5    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �      	         '                                    '')�      	         6                $actorInfo = array('error'  => false,)5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �      	         '                                    '')5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �      	         &                                   '')5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                             SR�     �               5                $actorInfo = array('error'  => false,5�_�                       /    ����                                                                                                                                                                                                                                                                                                                                                             SR�     �      	         0                                   'Actor Name')5�_�                        >    ����                                                                                                                                                                                                                                                                                                                                                             SR�     �      
         ?                                   'Actor Name' => $actorname,)5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                             SR�     �      	         /                    'Actor Name' => $actorname,5�_�       "           !      >    ����                                                                                                                                                                                                                                                                                                                                                             SR�     �      
         >                                   'Actor Name' => $actorname,5�_�   !   #           "   	   $    ����                                                                                                                                                                                                                                                                                                                                                             SR�%     �      
         %                                   ''5�_�   "   $           #   	   -    ����                                                                                                                                                                                                                                                                                                                                                             SR�/     �      
         -                                   'Actor ID'5�_�   #   %           $   
       ����                                                                                                                                                                                                                                                                                                                                                             SR�=     �   	                            )5�_�   $   &           %   
       ����                                                                                                                                                                                                                                                                                                                                                             SR�@     �   	                            );5�_�   %   '           &   
   $    ����                                                                                                                                                                                                                                                                                                                                                             SR�V     �   	            $                                  );5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                             SR�f     �   
                            $actormovies5�_�   '   )           (      :    ����                                                                                                                                                                                                                                                                                                                                                             SR�w     �   
            :                $actormovies = json_decode($actor->Movies)5�_�   (   *           )      ;    ����                                                                                                                                                                                                                                                                                                                                                             SR�}     �   
            ;                $actormovies = json_decode($actor->Movies);5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                             SR�~     �                               foreach ()�                               5�_�   *   ,           +      0    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               0                foreach ($actormovies as $movie)5�_�   +   -           ,      2    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               3                foreach ($actormovies as $movie) {}5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                             SR��     �                               }5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                             SR��     �                               5�_�   .   0           /           ����                                                                                                                                                                                                                                                                                                                                                             SR��     �                                    $movielist[]5�_�   /   1           0      5    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               6                    $movielist[] = array('Movie Name')5�_�   0   2           1      H    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               ,                                         '')�               I                    $movielist[] = array('Movie Name'   => $movie->name,)5�_�   1   3           2      7    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               8                                         'Release Year')5�_�   2   4           3      P    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               P                                         'Release Year' => $movie->release_year)5�_�   3   5           4      O    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               Q                                         'Release Year' => $movie->release_year);5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                                                             SR�     �                               }5�_�   5   7           6          ����                                                                                                                                                                                                                                                                                                                                                             SR�     �               $                $movielist = array()�                               5�_�   6   8           7      +    ����                                                                                                                                                                                                                                                                                                                                                             SR�     �               ,                $movielist = array('Movies')5�_�   7   9           8      ;    ����                                                                                                                                                                                                                                                                                                                                                             SR�$     �               ;                $movielist = array('Movies' => $movielist);5�_�   8   :           9          ����                                                                                                                                                                                                                                                                                                                                                             SR�,     �                               return Tr5�_�   9   ;           :          ����                                                                                                                                                                                                                                                                                                                                                             SR�N     �                           else {}�                           }5�_�   :   <           ;          ����                                                                                                                                                                                                                                                                                                                                                             SR�Q     �                           else {}5�_�   ;   =           <          ����                                                                                                                                                                                                                                                                                                                                                             SR�Q     �                           }5�_�   <   >           =          ����                                                                                                                                                                                                                                                                                                                                                             SR�R     �                           5�_�   =   ?           >      3    ����                                                                                                                                                                                                                                                                                                                                                             SR�e     �               5                return Response::json(array('error'))5�_�   >   @           ?      @    ����                                                                                                                                                                                                                                                                                                                                                             SR�m     �               B                return Response::json(array('error'     => true,))5�_�   ?   A           @          ����                                                                                                                                                                                                                                                                                                                                                             SR�q     �                               ))5�_�   @   B           A          ����                                                                                                                                                                                                                                                                                                                                                             SR�u     �                               ));5�_�   A   C           B      %    ����                                                                                                                                                                                                                                                                                                                                                             SR�x     �               (                                     ));5�_�   B   D           C      %    ����                                                                                                                                                                                                                                                                                                                                                             SR�}     �               %                                     5�_�   C   E           D      %    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               (                                     ));5�_�   D   F           E      +    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               ,                                            5�_�   E   G           F      9    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               :                                            'description' 5�_�   F   H           G      8    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               @                return Response::json(array('error'     => true,5�_�   G   I           H      ?    ����                                                                                                                                                                                                                                                                                                                                                             SR��     �               ?                                            'description'   => 5�_�   H               I      o    ����                                                                                                                                                                                                                                                                                                                                                             SR��    �               o                                            'description'   => 'We could not find any actor in database like: '5��