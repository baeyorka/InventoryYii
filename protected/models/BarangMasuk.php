<?php

/**
 * This is the model class for table "barang_masuk".
 *
 * The followings are the available columns in table 'barang_masuk':
 * @property integer $id
 * @property string $kode_barang
 * @property integer $jumlah
 * @property string $tanggal
 * @property integer $user_id
 */
class BarangMasuk extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return BarangMasuk the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'barang_masuk';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('kode_barang, jumlah, tanggal, user_id', 'required'),
			array('jumlah, user_id', 'numerical', 'integerOnly'=>true),
			array('kode_barang', 'length', 'max'=>25),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, kode_barang, jumlah, tanggal, user_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'kode_barang' => 'Kode Barang',
			'jumlah' => 'Jumlah',
			'tanggal' => 'Tanggal',
			'user_id' => 'User',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('kode_barang',$this->kode_barang,true);
		$criteria->compare('jumlah',$this->jumlah);
		$criteria->compare('tanggal',$this->tanggal,true);
		$criteria->compare('user_id',$this->user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}