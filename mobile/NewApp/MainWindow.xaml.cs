using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
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
using Image = System.Windows.Controls.Image;

namespace NewApp
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
        
        public void ThisPage(string content, Menu menu)
        {           
            NamePage.Content = content;
            
            menu.Visibility = Visibility.Visible;
        }

        private void Profile_Click(object sender, RoutedEventArgs e)
        {
            ThisPage("Профиль", ProfilePage);
        }

        private void MyMusic_Click(object sender, RoutedEventArgs e)
        {
            ThisPage("Моя музыка", MyMusicPage);
            
            
        }

        private void Settings_Click(object sender, RoutedEventArgs e)
        {           
            ThisPage("Настройки", SettingsPage);
        }

        private void Main_Click(object sender, RoutedEventArgs e)
        {
            ThisPage("Главная", MainPage);
        }
    }


}
