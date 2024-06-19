// cpp program
// console based to-do list
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <vector>
#include <iterator>
#include <string.h>

std::vector<std::string> task_list;
std::vector<bool> task_status;

// function to insert new task in list
void insert_task(std::string task)
{
    task_list.push_back(task);
    task_status.push_back(1);
    std::cout << "Task Added \n\n";
}

// delete a task from list using task number
void delete_task(int key)
{
    if (task_list.size() > 0)
    {
        task_list.erase(task_list.begin() + key - 1);
        task_status.erase(task_status.begin() + key - 1);
        std::cout << "Task Removed \n\n";
    }
    else
    {
        std::cout << "No Task Avaliable \n\n";
    }
}

// reverse the task status using task number
void change_status(int key)
{
    if (key <= task_list.size())
    {
        task_status[key - 1] = !task_status[key - 1];
    }
    else
    {
        std::cout << "No Task Avaliable \n\n";
    }
}

// display task list
void display_task()
{
    if (task_list.size() > 0)
    {
        std::cout << "No.\tStatus\tTask\n";
        for (int i = 0; i < task_list.size(); i++)
        {
            /* code */
            std::cout << i + 1 << "\t";
            task_status[i] ? std::cout << "Active  \t" : std::cout << "InActive\t";
            std::cout << task_list[i] << " \n";
        }
    }
    else
    {
        std::cout << "No Task Avaliable \n\n";
    }
}

// store task list in a external file
void store_task_list()
{
    try
    {
        std::ofstream file("Task_List.txt");
        if (file.is_open())
        {
            for (int i = 0; i < task_list.size(); i++)
            {
                file << task_list[i] << "\t" << task_status[i] << "\n";
            }
        }
        else
        {
            throw std::runtime_error("Failed to open file: Task_List.txt");
        }
    }
    catch (const std::exception &e)
    {
        std::cerr << "Error storing task list: " << e.what() << std::endl; // Use std::endl for flushing
    }
}
int main(int argc, char const *argv[])
{
    bool close = false;
    int choice = 0;
    /* code */
    while (!close)
    {
        /* code */
        std::cout << "\t* Welcome to Task List *\n\n"
                  << "Avaliable Options :: \n";
        std::cout << "1.Enter Task\t2.Delete Task\n3.Display Task\t4.Change Status\n";
        std::cout << "5.Close Task\t6.Store in File\n\n";
        std::cout << "Enter choice Number : ";
        std::cin >> choice;

        switch (choice)
        {
        case 1:
        {
            std::string task;
            std::cout << "Enter task: ";
            std::cin>>task;
            insert_task(task);
            break;
        }
        case 2:
        {
            int task_num;
            std::cout << "Enter task number to delete: ";
            std::cin >> task_num;
            delete_task(task_num);
            break;
        }
        case 3:
            display_task();
            break;
        case 4:
        {
            int task_num;
            std::cout << "Enter task number to change status: ";
            std::cin >> task_num;
            change_status(task_num);
            break;
        }
        case 5:
            std::cout << "Closing task list\n";
            close = true;
        case 6:
            store_task_list();
            break;
        default:
            std::cout << "Invalid choice!\n\n";
        }
    }

    return 0;
}
