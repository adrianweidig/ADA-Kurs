
package body Genimals is
   procedure Lion is
   begin
      Tierbruellen;
      Put_Line("                                        \|\||");
      Put_Line("                                      -' ||||/");
      Put_Line("                                     /7   |||||/");
      Put_Line("                                    /    |||||||/`-.____________");
      Put_Line("                                    \-' |||||||||               `-._");
      Put_Line("                                     -|||||||||||               |` -`.");
      Put_Line("                                       ||||||               \   |   `\\");
      Put_Line("                                        |||||\  \______...---\_  \    \\");
      Put_Line("                                           |  \  \           | \  |    ``-.__--.");
      Put_Line("                                          |  |\  \         / / | |       ``---'");
      Put_Line("                                        _/  /_/  /      __/ / _| |");
      Put_Line("                                       (,__/(,__/      (,__/ (,__/");
      Play_Sound("D:\Entwicklung\_Repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\src\99_EXTRAS\lion.wav");
   end Lion;

   procedure Bear is
   begin
      Tierbruellen;
      Put_Line("           .-''-.                    _");
      Put_Line("          /  _   \              _   /|)");
      Put_Line("        .'---''-.|             /|) /|/");
      Put_Line("      .'          `.          /|/ /|/");
      Put_Line("   __/_             \    .   /|/ /|/");
      Put_Line(" .'    `-.          .8-. \\-/|/ /|/");
      Put_Line("J   .--.  Y     .o./ .o8\ |/\ `/_.-.");
      Put_Line("|  (    \       98P  888| /\ / ( ` |");
      Put_Line("|  `-._/          |   `'|/\ / \|\  F");
      Put_Line(" `.     .            '-'|\ / \/\  J");
      Put_Line("   |---'              _/\ / \// ` |");
      Put_Line("   J                 /// /   /   F");
      Put_Line("   _\    .'`-._    ./// /   /\\.'");
      Put_Line("  /  `. / .-'  `<-'/// /  _/\ \\");
      Put_Line("  F.--.\||       `.`/ /.-' )|\ \`.");
      Put_Line("  \__.-/)'         `.-'   ')/\\  /");
      Put_Line(" .-' .'/  \               ')  `-'");
      Put_Line("(  .'.'   '`.            .'");
      Put_Line(" \'.'    '   `.       .-'");
      Put_Line("  /     '      `.__.-'/|");
      Put_Line(" J     :          `._/ |");
      Put_Line(" |     :               |");
      Put_Line(" J     ;-'''-.         F");
      Put_Line("  \   /       \       /");
      Put_Line("   `.J         L   _.'");
      Put_Line("     F         |--' |");
      Put_Line("     J         |    |__");
      Put_Line("      L        |       `.");
      Put_Line("     |        |-.      \|");
      Put_Line("     |           \   )_.'");
      Put_Line("     F        -.\ )-'");
      Put_Line("     \         )_)");
      Put_Line("      `''''''''");
      Play_Sound("D:\Entwicklung\_Repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\src\99_EXTRAS\bear.wav");
   end Bear;

   ---------------
   -- Mache_Ton --
   ---------------
   procedure Bruellen is
   begin
      case Tier is
         when Loewe => Lion;
         when Baer  => Bear;
      end case;
   end Bruellen;

end Genimals;
