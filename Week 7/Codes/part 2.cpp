#include <iostream>
#include <occi.h>
#include <iomanip>

using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;
int main(void)
{
   /* OCCI Variables */
   Environment* env = nullptr;
   Connection* conn = nullptr;
   /* Used Variables */
   string user = "dbs211_203c08";
   string pass = "20012223";
   string constr = "myoracle12c.senecacollege.ca:1521/oracle12c";
   try {
      env = Environment::createEnvironment(Environment::DEFAULT);
      conn = env->createConnection(user, pass, constr);
   
      Statement* stmt = nullptr;
      stmt = conn->createStatement();
      ResultSet* rs = nullptr;

      rs = stmt->executeQuery("SELECT e.employeenumber, e.firstname,e.lastname, o.phone, e.extension from employees e join offices o using (officecode) where reportsto is null or reportsto = '1002' or reportsto = '1056'order by e.employeenumber");
      
      
      for (int i = 0; i < 25; i++)
      {
         cout << "-";
      }

      cout << " Report 1 (Employee Report) ";

      for (int i = 0; i < 25; i++)
      {
         cout << "-";
      }


      cout << endl;

      cout << setfill(' ') << setw(13) << left << "Employee ID" << setw(15) << left << "First Name" << setw(15) << left << "Last Name" << setw(20) << left << "Phone" << setw(13) << left << "Extension" << endl;


      cout << setfill('-') << setw(13) << right << " ";  cout << setw(15) << right << " ";  cout << setw(15) << right << " ";  cout << setw(20) << right << " ";  cout << setw(13) << right << " " << endl;

      if (!rs->next()) {
         // if the result set is empty
         cout << "ResultSet is empty." << endl;
      }
      else {
         // if the result set in not empty
         do {
            
            int employeeNumber = rs->getInt(1);
            string firstName = rs->getString(2);
            string lastName = rs->getString(3);
            string Phone = rs->getString(4);
            string Extension = rs->getString(5);
            cout << setfill(' ') << setw(13) << left << employeeNumber << setw(15);
            cout << left << firstName << setw(15) << left << lastName; cout << setw(20) << left << Phone; cout << setw(13) << left << Extension << endl;
         } while (rs->next()); //if there is more rows, iterate
      }

      env->terminateConnection(conn);
      Environment::terminateEnvironment(env);
   }
   catch (SQLException& sqlExcp) {
      cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
   }
   return 0;
}