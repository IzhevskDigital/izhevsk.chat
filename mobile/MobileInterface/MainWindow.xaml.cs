using NewApp;
using NewApp.Properties;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Color = System.Windows.Media.Color;
using Image = System.Windows.Controls.Image;

namespace MobileInterface
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        
        
        public MainWindow()
        {
            InitializeComponent();
            
        }


        private void RepaintButton(Button button)
        {
            Foreground = new LinearGradientBrush
            {
 
                    
            }; 
        }

        private void ShowPage(string text, Grid grid)
        {
            TextBlock.Text = text;
            //ContentGrid.;
        }

        private void ShowProfilePage(object sender, RoutedEventArgs e)
        {
            RepaintButton(ProfileButton);
        }

        private void ShowMainPage(object sender, RoutedEventArgs e)
        {
            RepaintButton(MainPageButton);
        }

        private void ShowMyMusicPage(object sender, RoutedEventArgs e)
        {
            RepaintButton(MyMusicButton);
        }

        private void ShowSettingsPage(object sender, RoutedEventArgs e)
        {
            RepaintButton(SettingsButton);
        }

        private void ExitApp(object sender, RoutedEventArgs e)
        {
            RepaintButton(ExitButton);
            Close();
        }
    }


}
