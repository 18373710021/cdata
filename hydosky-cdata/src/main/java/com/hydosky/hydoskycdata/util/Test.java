package com.hydosky.hydoskycdata.util;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Test {

    public static void main(String[] args) {
        User user1 = new User(1, "张三");
        User user2 = new User(2, "李四");
        User user3 = new User(3, "王五");
        User user4 = new User(4, "赵六");
        User user5 = new User(5, "田七");
        User user6 = new User(6, "田七");
        User user7 = new User(7, "田七");
        User user8 = new User(8, "田七");
        User user9 = new User(9, "田七");
        User user10 = new User(10, "田七");
        User user11 = new User(11, "田七");
        User user12 = new User(12, "田七");
        User user13 = new User(13, "田七");
        List<User> userList = new ArrayList<>();
        userList.add(user1);
        userList.add(user2);
        userList.add(user3);
        userList.add(user4);
        userList.add(user5);
        userList.add(user6);
        userList.add(user7);
        userList.add(user8);
        userList.add(user9);
        userList.add(user10);
        userList.add(user11);
        userList.add(user12);
        userList.add(user13);
        System.out.println("++++++++++++++++++++++++++++++++++++");
        for (User user : userList) {
            System.out.println(user.toString());
        }
        System.out.println("++++++++++++++++++++++++++++++++++++");
        Runnable testRun = new TestRunable(userList);
        ExecutorService executorService = Executors.newCachedThreadPool();
        for (int i = 0; i < userList.size(); i++) {
            executorService.submit(testRun);
        }
        executorService.shutdown();
    }


}

class TestRunable implements Runnable {

    private List<User> userList;

    public TestRunable(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public void run() {
        Integer id = getId();
        System.out.println(Thread.currentThread().getName() + "---------- id：" + id);
    }

    private synchronized Integer getId() {
        if (CollectionUtils.isEmpty(userList)) {
            System.out.println("集合为空");
            return -1;

        }
        int index = RandomUtil.getInt(userList.size());
        User user = userList.get(index);
        userList.remove(index);
        return user.getId();
    }
}

@Data
class User implements Serializable {

    private int id;
    private String name;

    public User() {
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}