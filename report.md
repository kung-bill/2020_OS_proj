### 設計:

利用函數 **int proc_exec( struct process proc )** 執行傳入參數的 process。

開始與暫停一個 **process** ，我們透過設定該 **process** 的 **priority** 來實現這兩個功能。

主要是呼叫 **sched_setscheduler()** 函數來達成，其中，使用 **sched_setscheduler()**  時，需查閱 int policy 相關規定去設定 struct sched_param 的 priority 數值。例如 SCHED_FIFO 的 priority 介於 1 到 99 之間。



### 核心版本:

```
linux-4.14.25
```



### 比較實際結果與理論結果，並解釋造成差異的原因:

依照我們預期的，FIFO應該是要先入先出，先進來的process會做完才跑第二進來的process，但是在我們的實驗中，發現似乎FIFO會在執行第一個process還沒完全執行完的時候，會執行後面的其他process，如圖所示：

![Capture](C:\Users\RaoBlack\Desktop\Capture.PNG)

我覺得原因可能是，**sched_setscheduler**是利用更改 priority 來選擇誰先執行，但是在設定priority 的時候可能沒有考慮到一些邊界效應，導致可能會有第二進入的process，在第一個還沒執行完畢的時候，又在執行。



