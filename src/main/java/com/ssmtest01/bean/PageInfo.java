package com.ssmtest01.bean;

import com.github.pagehelper.Page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PageInfo<T>  implements Serializable {
    private static final long serialVersionUID=1L;
    //当前页
    private  int pageNum;
    //每一页的数量
    private  int pageSize=5;
    //总记录数
    private long total;
    //总页数
    private int pages;

    //结果集
    private List<T> list;
/*
    //当前页面第一个元素在数据库的行号
    private  int startRow;
    //当前页面最后一个元素在数据库的行号
    private  int endRow;


    //当前页的数量
    private int size;

    //前一页
    private int prePage;
    //下一页
    private  int nextPage;

    //是否为第一页
    private boolean isFirstPage =false;
    //是否为最后一页
    private boolean isLastPage =false;
    //是否有前一页
    private boolean hasPreviousPage =false;
    //是否有下一页
    private boolean hasNextPage =false;
    //导航页码数
    private int navigatePages;
    //所有导航页号
    private int[] navigatepageNums;
    //导航条上的第一页
    private int navigateFirstPage;
    //导航条上的最后一页
    private int navigateLastPage;*/

    public PageInfo() {
    }

   /* public PageInfo( List<T> list) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.total = total;
        this.pages = pages;
        this.list = list;
    }*/
    //    public PageInfo( List<T> list) {
//        Page<?> page =(Page<?>) list;
//        this.pageNum = page.getPageNum();
//        this.pageSize = page.getPageSize();
//        this.total = page.getTotal();
//        this.pages = page.getPages();
//        this.list = list;
//    }

     public PageInfo( List<T> list) {
        Page<?> page =(Page<?>) list;
        this.pageNum = page.getPageNum();
        this.pageSize = page.getPageSize();
        this.total = page.getTotal();
        this.pages = page.getPages();
         List<T> tempUserList = new ArrayList<>();
         for(int i=0;i<list.size();i++){
             tempUserList.add(list.get(i));
         }
        this.list = tempUserList;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageInfo{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", total=" + total +
                ", pages=" + pages +
                ", list=" + list +
                '}';
    }
}
